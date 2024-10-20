import ballerina/uuid;
import ballerinax/mongodb;
import my_main_program.types;


public class IssueDBManager {
    private final mongodb:Collection collection;

    public function init(string dbName) returns error? {
        mongodb:Database dataBase = check mongoDbClient->getDatabase(dbName);
        self.collection = check dataBase->getCollection("issue");
    }
    
    public  function getAll() returns types:Issue[]|error {
        stream<types:Issue, error?> result = check self.collection->find();
        return from types:Issue m in result select m;
    }

    public function findOne(map<json> filterAttribute) returns types:Issue|error {
        types:Issue[]|error result = self.get(filterAttribute);
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

    public function insertOne(types:IssueContent input) returns types:Issue|error {
        string id = uuid:createType1AsString();
        types:Issue issue = {id, ...input};
        check self.collection->insertOne(issue);
        return issue;
    }
    

    public function updateOne(types:IssueContentUpdate update, map<json> filterAttribute) returns types:Issue|error {
        mongodb:UpdateResult updateResult = check self.collection->updateOne(filterAttribute, {set: update});
        if updateResult.modifiedCount != 1 {
            return error(string `Failed to update the issue with ${filterAttribute.toString()}`);
        }
        types:Issue[]|error updatedResult = self.get(filterAttribute);
        if !(updatedResult is error){
            return updatedResult[0];
        } else {
            return updatedResult;
        }
    }

    public function deleteOne( map<json> filterAttribute) returns boolean|error {
        mongodb:DeleteResult deleteResult = check self.collection->deleteOne(filterAttribute);
        if deleteResult.deletedCount != 1 {
            return error(string `Failed to delete the issue ${filterAttribute.toString()}`);
        }
        return true;
    }

    public  function get(map<json> filterAttribute) returns types:Issue[]|error {
        stream<types:Issue, error?> findResult = check self.collection->find(filterAttribute);
        types:Issue[] result = check from types:Issue m in findResult
            select m;
        return result;
    }

}