import my_main_program.mongodb;
import ballerina/io;

public function main() returns error? {
   mongodb:DBUtils DBUtils = check new mongodb:DBUtils("main");
   mongodb:Movie|error  a = DBUtils.insertOne({title: "sd", year:  2, directorId: "dsfdsf"},"aa");
   io:println(a);
}