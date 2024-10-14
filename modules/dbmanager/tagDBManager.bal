import ballerina/uuid;
import ballerinax/mongodb;
import my_main_program.types;


public class TagDBManager {
    private final mongodb:Database dataBase;

    public function init(string dbName) returns error? {
        self.dataBase = check mongoDbClient->getDatabase(dbName);
    }
    
    public  function getAll(string collectionName) returns types:Tag[]|error {
        mongodb:Collection movies = check self.dataBase->getCollection(collectionName);
        stream<types:Tag, error?> result = check movies->find();
        return from types:Tag m in result select m;
    }

    public function findOne(string collectionName, map<json> filterAttribute) returns types:Tag|error {
        return self.get(self.dataBase, collectionName, filterAttribute);
    }

    public function insertOne(types:TagContent input, string collectionName) returns types:Tag|error {
        string id = uuid:createType1AsString();
        types:Tag movie = {id, ...input};
        mongodb:Collection movies = check self.dataBase->getCollection(collectionName);
        check movies->insertOne(movie);
        return movie;
    }
    


    public function updateOne(types:TagContentUpdate update, string collectionName, map<json> filterAttribute) returns types:Tag|error {
        mongodb:Collection movies = check self.dataBase->getCollection(collectionName);
        mongodb:UpdateResult updateResult = check movies->updateOne(filterAttribute, {set: update});
        if updateResult.modifiedCount != 1 {
            return error(string `Failed to update the movie with ${filterAttribute.toString()}`);
        }
        return self.get(self.dataBase, collectionName, filterAttribute);
    }

    public function deleteOne(string collectionName, map<json> filterAttribute) returns boolean|error {
        mongodb:Collection movies = check self.dataBase->getCollection(collectionName);
        mongodb:DeleteResult deleteResult = check movies->deleteOne(filterAttribute);
        if deleteResult.deletedCount != 1 {
            return error(string `Failed to delete the movie ${filterAttribute.toString()}`);
        }
        return true;
    }

    private function get(mongodb:Database dataBase, string collectionName, map<json> filterAttribute) returns types:Tag|error {
        mongodb:Collection movies = check dataBase->getCollection(collectionName);
        stream<types:Tag, error?> findResult = check movies->find(filterAttribute);
        types:Tag[] result = check from types:Tag m in findResult
            select m;
        if result.length() != 1 {
            return error(string `Failed to find a movie with id ${filterAttribute.toString()}`);
        }
        return result[0];
    }

}