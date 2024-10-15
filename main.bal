// import my_main_program.dbmanager;
// import my_main_program.types;
import my_main_program.similarityfinder as SF;
import my_main_program.types as types;
import ballerina/io;

public function main() returns error? {
   //dbmanager:IssueDBManager db = check new dbmanager:IssueDBManager("main");
   //types:Issue|error  a = check db.insertOne({parent_id:"sa", title:"23", description:"343", created_at:"ds", timestamp:232, created_by: "ds", tags: "ss", commentIds: "", downVotes: 0 ,upVotes: 0},"1");
   //types:Issue|error  a = check DBUtils.findOne("1", {title: "23"});
   //types:Issue|error  a = check DBUtils.updateOne({title: "updated one"}, "aa" , {title : "23"});
   //boolean|error  a = check DBUtils.deleteOne("aa" , "01ef896c-29a6-11c0-afd5-0921d3b0d5d8");
  //types:Issue[]|error   a = check db.getAll("1");
   //io:println(a);

   SF:SimilarityFinder similarityFinder = new SF:SimilarityFinder();
   types:Issue[] a = similarityFinder.getSimilarityOrder("The cat is sitting on the window, watching the birds.", [
      {parent_id:"sa", title:"The cat is perched by the window, observing the birds outside.", description:"343", created_at:"ds", timestamp:232, created_by: "ds", tags: "ss", commentIds: "", downVotes: 0 ,upVotes: 0,id: ""},
  {parent_id:"sa", title:"The cat is perched by the window, observing the birds outside.", description:"343", created_at:"ds", timestamp:232, created_by: "ds", tags: "ss", commentIds: "", downVotes: 0 ,upVotes: 0,id: ""},
  {parent_id:"sa", title:"The cat is perched by the window, observing the birds outside.", description:"343", created_at:"ds", timestamp:232, created_by: "ds", tags: "ss", commentIds: "", downVotes: 0 ,upVotes: 0,id: ""}
  ]
);

 io:println(a);
}
