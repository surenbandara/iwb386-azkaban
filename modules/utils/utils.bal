import ballerina/regex;

public function stringToListConverter(string item) returns string[] {
    string[] stringList = regex:split(item, " ");
    return stringList;
}

public function listToStringConverter(string[] list1) returns string {
    string output = "";
    list1.forEach(function (string item) {output = item +" ";});
    return output;
}
