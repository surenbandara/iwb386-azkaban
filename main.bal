import my_main_program.mongodb;
import my_main_program.types;
import ballerina/io;

public function main() returns error? {
   mongodb:DBUtils DBUtils = check new mongodb:DBUtils("main");
   types:Movie|error  a = check DBUtils.insertOne({title: "sd", year:  2, directorId: "dsfdsf"},"aa");
   io:println(a);
}