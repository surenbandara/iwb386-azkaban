public type MovieInput record {|
    string title;
    int year;
    string directorId;
|};

public type MovieUpdate record {|
    string title?;
    int year?;
    string directorId?;
|};

public type Movie record {|
    readonly string id;
    *MovieInput;
|};
