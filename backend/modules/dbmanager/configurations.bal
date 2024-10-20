import ballerinax/mongodb;


configurable string host = "localhost";
configurable int port = 27017;  
configurable string dbName = "main";

mongodb:Client mongoDbClient = check new ({
    connection: {
        serverAddress: {
            host,
            port
        }
    }
});

