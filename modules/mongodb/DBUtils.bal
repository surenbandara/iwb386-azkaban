import ballerina/uuid;
import ballerinax/mongodb;
import my_main_program.types;

configurable string host = "localhost";
configurable int port = 27017;


final mongodb:Client mongoDb = check new ({
    connection: {
        serverAddress: {
            host,
            port
        }
    }
});


public class DBUtils {
    private final mongodb:Database moviesDb;

    public function init(string dbName) returns error? {
        self.moviesDb = check mongoDb->getDatabase(dbName);
    }
    
    public  function getAll(string collectionName) returns types:Movie[]|error {
        mongodb:Collection movies = check self.moviesDb->getCollection(collectionName);
        stream<types:Movie, error?> result = check movies->find();
        return from types:Movie m in result select m;
    }

    public function findOne(string collection, string collectionName, string id) returns types:Movie|error {
        return self.get(self.moviesDb, collectionName, id);
    }

    public function insertOne(types:MovieInput input, string collectionName) returns types:Movie|error {
        string id = uuid:createType1AsString();
        types:Movie movie = {id, ...input};
        mongodb:Collection movies = check self.moviesDb->getCollection(collectionName);
        check movies->insertOne(movie);
        return movie;
    }
    


    public function updateOne(types:MovieUpdate update, string collectionName, string id) returns types:Movie|error {
        mongodb:Collection movies = check self.moviesDb->getCollection(collectionName);
        mongodb:UpdateResult updateResult = check movies->updateOne({id}, {set: update});
        if updateResult.modifiedCount != 1 {
            return error(string `Failed to update the movie with ${id}`);
        }
        return self.get(self.moviesDb, collectionName, id);
    }

    public function deleteOne(string collectionName, string id) returns string|error {
        mongodb:Collection movies = check self.moviesDb->getCollection(collectionName);
        mongodb:DeleteResult deleteResult = check movies->deleteOne({id});
        if deleteResult.deletedCount != 1 {
            return error(string `Failed to delete the movie ${id}`);
        }
        return id;
    }

    private function get(mongodb:Database moviesDb, string collectionName, string id) returns types:Movie|error {
        mongodb:Collection movies = check moviesDb->getCollection(collectionName);
        stream<types:Movie, error?> findResult = check movies->find({id});
        types:Movie[] result = check from types:Movie m in findResult
            select m;
        if result.length() != 1 {
            return error(string `Failed to find a movie with id ${id}`);
        }
        return result[0];
    }

}