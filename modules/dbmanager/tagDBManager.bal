import ballerina/uuid;
import ballerinax/mongodb;
import my_main_program.types;
//import ballerina/io;

public type TagN record {|
    string tag_name;
|};

public class TagDBManager {
    private final mongodb:Collection collection;

    public function init(string dbName) returns error? {
        mongodb:Database dataBase = check mongoDbClient->getDatabase(dbName);
        self.collection = check dataBase->getCollection("tag");
    }
    
    public  function getAll() returns types:Tag[]|error {
        stream<types:Tag, error?> result = check self.collection->find();
        return from types:Tag m in result select m;
    }

    public function findOne( map<json> filterAttribute) returns types:Tag|error {
        types:Tag[]|error result = self.get(filterAttribute);
        if !(result is error){
            if result.length() == 1 {
                return result[0];
            } else {
                 return error("Output lenght is zero or more than one");
            }
        } else {
            return result;
        }
    }

    public function insertOne(types:TagContent input) returns types:Tag|error {
        string id = uuid:createType1AsString();
        types:Tag tag = {id, ...input};
        check self.collection->insertOne(tag);
        return tag;
    }


    public function updateOne(types:TagContentUpdate update, map<json> filterAttribute) returns types:Tag|error {
        mongodb:UpdateResult updateResult = check self.collection->updateOne(filterAttribute, {set: update});
        if updateResult.modifiedCount != 1 {
            return error(string `Failed to update the tag with ${filterAttribute.toString()}`);
        }
        types:Tag[]|error updatedResult = self.get(filterAttribute);
        if !(updatedResult is error){
            return updatedResult[0];
        } else {
            return updatedResult;
        }
    }

    public function deleteOne(string collectionName, map<json> filterAttribute) returns boolean|error {
        mongodb:DeleteResult deleteResult = check self.collection->deleteOne(filterAttribute);
        if deleteResult.deletedCount != 1 {
            return error(string `Failed to delete the tag ${filterAttribute.toString()}`);
        }
        return true;
    }

    public  function get(map<json> filterAttribute) returns types:Tag[]|error {
        stream<types:Tag, error?> findResult = check self.collection->find(filterAttribute);
        types:Tag[] result = check from types:Tag m in findResult
            select m;
        return result;
    }

}