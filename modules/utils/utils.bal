import ballerina/regex;

public function stringToListConverter(string item) returns string[] {
    string[] stringList = regex:split(item, "\\|");
    return stringList;
}

public function listToStringConverter(string[] list1) returns string {
    string output = "";
    if list1.length() == 1 {
        return list1[0];
    } else {
        foreach int i in 0... list1.length()-1{
             output = output + list1[i];
            if i != list1.length()-1 {
                output = output +  "|";
            }
        }
        
        return output;
    }
}
