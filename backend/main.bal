import backend.dbmanager;
import backend.types as types;
import backend.utils as utils;
import ballerina/http;
import ballerina/time;
import backend.similarityfinder;
import ballerina/io;


dbmanager:IssueDBManager issueDB = check new dbmanager:IssueDBManager();
dbmanager:TagDBManager tagDB = check new dbmanager:TagDBManager();
http:Client authClient = check new ("localhost:9090/auth");

@http:ServiceConfig {
    cors: {
        allowOrigins: ["http://localhost:3000"],   
        allowCredentials: true,                  
        allowMethods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],  
        allowHeaders: ["Content-Type", "Authorization"], 
        exposeHeaders: ["X-CUSTOM-HEADER"],        
        maxAge: 86400 
    }
}

service /api on new http:Listener(9091) {

   private similarityfinder:SimilarityFinder similarityfinder = new similarityfinder:SimilarityFinder();
    
    resource function post issue(types:IssueCreateRequest issueCreateRequest) returns types:Issue|http:InternalServerError|http:Unauthorized|error {
      types:User|error user = authClient->/users(headers = {Authorization : "Bearer "+issueCreateRequest.token});
     if !(user is error){ 
        types:IssueContent issue = {description: "", created_at: "" , created_by: "", timestamp: 0, views: 0, tags: "", status: false};
        issue.description = issueCreateRequest.description;
        issue.title = issueCreateRequest.title;
        issue.tags = utils:listToStringConverter(issueCreateRequest.tags);
        issue.parent_id = issueCreateRequest.parent_id;
        issue.created_at = time:monotonicNow().toString();
        issue.timestamp =  <int>time:monotonicNow();
        issue.issue_type = issueCreateRequest.issue_type;
        issue.created_by  = user.name;


        types:Issue|error result =  issueDB.insertOne(issue);
        if !(result is error){
         foreach string tag in issueCreateRequest.tags {
            types:Tag|error tagRecord = tagDB.findOne({"tag_name": tag});
            if tagRecord is types:Tag {
               _ = check tagDB.updateOne({issue_ids: tagRecord.issue_ids + "|" + result.id},{"tag_name": tag});
            } else {
               _ = check tagDB.insertOne({tag_name: tag , issue_ids: result.id});
            }
         }
         return result;
        } else {
         return http:INTERNAL_SERVER_ERROR;
        }
     } else {
      return http:UNAUTHORIZED;
     }
    }

    resource function post issues(types:IssueGetRequest issueGetRequest) returns types:Issue[]|http:InternalServerError|http:Unauthorized|error {  
     string? token = issueGetRequest.token;
     if !(token is null){
      types:User|error user = authClient->/users(headers = {Authorization : "Bearer "+token});
      if !(user is error){ 
         types:Issue[] output = [];
         string[] tagsRelatedIds = [];
         map<json> filterParams = <map<json>>issueGetRequest;
         _ = filterParams.remove("token");
         io:println(filterParams);

            if !(issueGetRequest.id is null) {
               types:Issue|error issue = issueDB.findOne({"id" : issueGetRequest.id});
               if !(issue is error) {
                  output.push(issue);
               }
            } else {
               if issueGetRequest.tags != null {
                  foreach string tag in issueGetRequest.tags?:[]{
                     types:Tag|error tagRecord = tagDB.findOne({"tag_name":tag});
                     if !(tagRecord is error ){
                        tagsRelatedIds.push(...utils:stringToListConverter(tagRecord.issue_ids));
                     } 
                  } on fail {
                     return http:INTERNAL_SERVER_ERROR;
                  }
                  _ = filterParams.remove("tags");
               }
               if tagsRelatedIds.length() != 0 {
                  foreach string tagsRelatedId in tagsRelatedIds{
                     filterParams["id"] = tagsRelatedId;
                     types:Issue[]|error dbOutput = issueDB.get(filterParams);
                     if !(dbOutput is error){
                        output.push(...dbOutput);
                     }
                  }
               } else {
                  types:Issue[]|error dbOutput = issueDB.get(filterParams);
                     if !(dbOutput is error){
                        output.push(...dbOutput);
                     }
               }
            }

            types:Issue[] findUniqeOutput = [];
            foreach types:Issue item in output {
               if findUniqeOutput.indexOf(item) is () {
                  findUniqeOutput.push(item);
               }
            } 
            

         return findUniqeOutput;
      } else {
            return http:UNAUTHORIZED;
      }
     } else {
      return http:UNAUTHORIZED;
     }
    }
    
    resource function post filter(types:IssueFilterRequest filterRequest) returns types:Issue[]|http:InternalServerError|http:Unauthorized|error {
      types:User|error user = authClient->/users(headers = {Authorization : "Bearer "+filterRequest.token});
      if !(user is error){ 
         types:Issue[] validIssues = [];
         if filterRequest.tags.length() != 0 {
            string[] validIssuesIds = [];
            foreach string tagName in filterRequest.tags {
               types:Tag|error tagData = tagDB.findOne({"tag_name":tagName });
               if !(tagData is error) {
                  string[] issuesIds = utils:stringToListConverter(tagData.issue_ids);
                  foreach string issueId in issuesIds {
                     if validIssuesIds.indexOf(issueId) is () {
                        validIssuesIds.push(issueId);
                     }
                  }
               }
            }

            foreach string validId in validIssuesIds {
               map<json?> filter =  {"id":validId , "issue_type": types:ISSUE};
               if !(filterRequest.status is null){
                  filter["status"] = filterRequest.status;
               }
               if !(filterRequest.created_by is null){
                  filter["created_by"] = filterRequest.created_by;
               }

               types:Issue|error issue = issueDB.findOne(filter);
               if!(issue is error) {
                  validIssues.push(issue);
               }
            }

         } else {
            map<json?> filter =  {"issue_type": types:ISSUE};
               if !(filterRequest.status is null){
                  filter["status"] = filterRequest.status;
               }

               if !(filterRequest.created_by is null){
                  filter["created_by"] = filterRequest.created_by;
               }

            validIssues =check issueDB.get(filter);
         }

         types:Issue[] filteredIssues = self.similarityfinder.getSimilarityOrder(filterRequest.description,validIssues);
         return filteredIssues;
      } else {
         return http:UNAUTHORIZED;
      }
    }

    resource function put update(types:IssueUpdateRequest issueUpdateRequest) returns types:Issue|http:InternalServerError|http:NotFound|http:Unauthorized|error {
      types:User|error user = authClient->/users(headers = {Authorization : "Bearer "+issueUpdateRequest.token});
      if !(user is error){
         if issueUpdateRequest.watched is null {
            string[]|null newTags = issueUpdateRequest.tags;
            types:IssueContentUpdate issueUpdateRecord = {title: issueUpdateRequest.title, description: issueUpdateRequest.description, status: issueUpdateRequest.status };
            if !(newTags is null) {
               if newTags.length() != 0 {
                  types:Issue|error existingIssue = issueDB.findOne({"id":issueUpdateRequest.id});
                  if!(existingIssue is error) {
                     if (existingIssue.tags != "") {
                     string[] tagNames = utils:stringToListConverter(existingIssue.tags);
                     foreach string tagName in tagNames {
                        types:Tag|error tagRecord = tagDB.findOne({"tag_name":tagName});
                        if !(tagRecord is error) {
                           string[] issueIds = utils:stringToListConverter(tagRecord.issue_ids);
                           if !(issueIds.indexOf(issueUpdateRequest.id) is ()) {
                              int index = <int>issueIds.indexOf(issueUpdateRequest.id);
                              _ = issueIds.remove(index);
                              _ = check tagDB.updateOne({issue_ids: utils:listToStringConverter(issueIds)},{"tag_name": tagName});
                           }
                        }
                     }

                  }
               }

                  foreach string tag in newTags {
                     types:Tag|error tagRecord = tagDB.findOne({"tag_name": tag});
                     if tagRecord is types:Tag {
                        _ = check tagDB.updateOne({issue_ids: tagRecord.issue_ids + "|" + issueUpdateRequest.id}, {"tag_name": tag});
                     } else {
                        _ = check tagDB.insertOne({tag_name: tag , issue_ids: issueUpdateRequest.id});
                     }
                  }
                  
                  issueUpdateRecord.tags = utils:listToStringConverter(newTags);

               }
            }
            types:Issue updatedIssue= check issueDB.updateOne(issueUpdateRecord, {"id":issueUpdateRequest.id});
            return updatedIssue;
         } else {
            types:Issue|error existingIssue = issueDB.findOne({"id":issueUpdateRequest.id});
            if!(existingIssue is error) {
               int views = existingIssue.views + 1;
               types:Issue updatedIssue= check issueDB.updateOne({"views": views}, {"id":issueUpdateRequest.id});
               return updatedIssue;
            } else {
               return http:NOT_FOUND;
            }
         }
      } else {
         return http:UNAUTHORIZED;
      }
     
    }

    resource function post issues/[string id](types:IssueDeleteRequest issueDeleteRequest) returns http:DELETE|http:InternalServerError|http:Unauthorized|error {
      types:User|error user = authClient->/users(headers = {Authorization : "Bearer "+issueDeleteRequest.token});
      if !(user is error){
         types:Issue|error existingIssue = issueDB.findOne({"id":id});
         if !(existingIssue is error){
            if(existingIssue.tags != "") {
               string[] tagNames = utils:stringToListConverter(existingIssue.tags);
               foreach string tagName in tagNames {
                  types:Tag|error tagRecord = tagDB.findOne({"tag_name":tagName});
                  if !(tagRecord is error){
                     string[] issueIds = utils:stringToListConverter(tagRecord.issue_ids);
                     if !(issueIds.indexOf(id) is ()) {
                        int index = <int>issueIds.indexOf(id);
                        _ = issueIds.remove(index);
                        _ = check tagDB.updateOne({issue_ids: utils:listToStringConverter(issueIds)}, {"tag_name": tagName});
                     }
                  }
               }
            }  
         }

         boolean deletion = check issueDB.deleteOne({"id": id});
         if deletion {
            return http:HTTP_DELETE;
         } else {
            return http:INTERNAL_SERVER_ERROR;
         }
      } else {
         return http:UNAUTHORIZED;
      }
    }
}

