import ballerina/http;
import ballerina/jwt;
import ballerina/io;

enum UserRole {
    ADMIN,
    DEVELOPER,
    TESTER
}

type User readonly & record {|
    string name;
    string password;
|};

type Role readonly & record {|
    string name;
    UserRole role;
|};

type ValidationResult readonly & record {|
    boolean validation;
    string? name;
    UserRole? role;
|};

table<User> key(name) userPasswords = table [
    {name: "lakshan", password: "123"},
    {name: "suren", password: "321"}
];

table<Role> key(name) userRoles = table [
    {name: "lakshan", role: ADMIN},
    {name: "suren", role: DEVELOPER}
];

// JWT validation configuration
configurable string jwtIssuer = "LSL knowledge hub";
configurable string jwtAudience = "employers";
configurable string jwtSecretKey = "your-256-bit-secret";

function getRole(string name) returns Role|error {
    if userRoles.hasKey(name) {
        // Get the Role record for the given name
        Role? userRole = userRoles.get(name);
        if userRole is Role {
            return userRole;
        } else {
            return error("User found but failed to validate Role type " + name);
        }
    } else {
        // Return an error if the user is not found
        return error("User not found: " + name);
    }
}

function jwtValidateMiddleware(http:Request request) returns ValidationResult|error {

    ValidationResult valResult = {
        validation: false,
        role: (),
        name: ()
    };
    // Extract the Authorization header (Bearer <token>)
    string? authHeader = check request.getHeader("Authorization");

    if authHeader is string && authHeader.startsWith("Bearer ") {

        // Extract the JWT token by removing 'Bearer ' prefix
        string token = authHeader.substring(7);

        // Create JWT validator configurations
        jwt:ValidatorConfig validatorConfig = {
            issuer: jwtIssuer,
            audience: jwtAudience,
            clockSkew: 60,
            keyId: jwtSecretKey
        };

        // Validate the token
        jwt:Payload|error result = jwt:validate(token, validatorConfig);

        // Check if the token is valid
        if result is jwt:Payload {

            Role|error role = getRole(result.sub ?: "");
            if role is error {
                return valResult;
            }
            valResult = {
                validation: true,
                name: result.sub,
                role: role.role
            };
            return valResult;

        } else {
            return valResult;
        }
    }
    return valResult;
}

// JWT Issuer Middleware
function jwtIssuerMiddleware(http:Request request) returns http:Response|error {

    http:Response response = new;

    // Extract the Authorization header (Bearer <token>)
    json payload = check request.getJsonPayload();
    User|error loginDetails = payload.cloneWithType(User);

    if loginDetails is error {
        response.setPayload("Invalid payload");
        return response;
    }

    // Check if the user exists in the table using the key (name)
    if userPasswords.hasKey(loginDetails.name) {
        // Get the user details
        User? user = userPasswords.get(loginDetails.name);

        if user is User {
            if (user.password == loginDetails.password) {
                jwt:IssuerConfig issuerConfig = {
                    username: user.name,
                    issuer: jwtIssuer,
                    audience: jwtAudience,
                    expTime: 86400,
                    keyId: jwtSecretKey,
                    signatureConfig: {
                        config: {
                            keyFile: "./private_key.pem"
                        }
                    }
                };
                string jwt = check jwt:issue(issuerConfig);
                response.setPayload(jwt);
            }
        } else {
            response.setPayload("Incorrect password");
        }
    }
    else {
        response.setPayload("User not found");
    }
    return response;
}


// Function to add users and roles
function addUsersAndRoles(string name, UserRole role) returns boolean|error {
    // Add new users to userPasswords table
    userPasswords.add({name: name, password: "123"});
    // TODO: functionality to set password by user
    userRoles.add({name: name, role: role});

    return true;
}


service / on new http:Listener(9090) {

    // Login and issue token
    resource function get login(http:Request request) returns http:Response|error {

        http:Response response = new;
        response = check jwtIssuerMiddleware(request);
        return response;
    }

    // Blue Print
    resource function get users(http:Request request) returns http:Response|error {

        http:Response response = new;

        ValidationResult|error validation = check jwtValidateMiddleware(request);
        if validation is ValidationResult{
            if validation.validation {
                // Do the functionality here----------------------------------------user role can be taken using validation.role
                
                io:println("User role: ", validation.role);
                response.setPayload(userRoles.toArray());
                return response;
            }
        }
        response.statusCode = http:STATUS_UNAUTHORIZED; // 401
        response.setPayload({message: "JWT validation failed: "});
        return response;
    }

    //admin can add users
    resource function post useradd(http:Request request) returns http:Response|error {

        http:Response response = new;

        ValidationResult|error validation = check jwtValidateMiddleware(request);
        if validation is ValidationResult{
            if validation.validation {
                if (validation.role == ADMIN){
                    json payload = check request.getJsonPayload();
                    //TODO add validation for request - maybe in yaml
                    // Role|error user = check payload.cloneWithType(Role);
                    // if user is error {
                    //     response.setPayload("Incorrect payload");
                    //     response.statusCode = http:STATUS_BAD_REQUEST; 
                    // }
                    boolean|error additionOperation = addUsersAndRoles(check payload.name, check payload.role);
                    if (additionOperation is boolean && additionOperation) {
                        response.setPayload("Succesfully added");
                        response.statusCode = http:STATUS_ACCEPTED; 
                    }
                } else {
                    response.setPayload("Not a ADMIN");
                    response.statusCode = http:STATUS_UNAUTHORIZED;
                }
                return response;
            }
        }
        response.statusCode = http:STATUS_UNAUTHORIZED; // 401
        response.setPayload({message: "JWT validation failed: "});
        return response;
    }

    // resource function post users(http:Request request) returns http:Response|error {
    //     json payload = check request.getJsonPayload();
    //     User user = check payload.cloneWithType();
    //     userPasswords.add(user);

    //     // Create a response and populate the headers/payload.
    //     http:Response response = new;
    //     response.setPayload(user);
    //     return response;
    // }

    // resource function get token(http:Request request) returns http:Response|error {
    //     // for refresh token
    //     http:Response response = new;
    //     response = check jwtIssuerMiddleware(request);
    //     return response;
    // }
}
