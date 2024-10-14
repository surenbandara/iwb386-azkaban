import ballerinax/mongodb;


configurable string host = "localhost";
configurable int port = 27017;  

public mongodb:Client mongoDbClient = check new ({
    connection: {
        serverAddress: {
            host,
            port
        }
    }
});
