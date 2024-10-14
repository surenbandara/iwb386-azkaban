public type Issue record {|
    readonly string id;
    *IssueContent;
|};

public type IssueContent record {|
    string parent_id?;
    string title?;
    string description;
    string created_by;
    string created_at;
    int timestamp;
    string commentIds;
    boolean status?;
    int upVotes;
    int downVotes;
    string tags;
|};

public type IssueContentUpdate record {|
    string parent_id?;
    string title?;
    string description?;
    string created_by?;
    string created_at?;
    int timestamp?;
    string commentIds?;
    boolean status?;
    int upVotes?;
    int downVotes?;
    string tags?;
|};

public type Tag record {|
    readonly string id;
    *TagContent;
|};

public type TagContent record {|
    string tag_name;
    string issue_ids;
|};

public type TagContentUpdate record {|
    string tag_name?;
    string issue_ids?;
|};



