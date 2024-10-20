public enum IssueType {
    COMMENT,
    ISSUE
}
public type Issue record {|
    readonly string id;
    *IssueContent;
|};

public type IssueContent record {|
    string parent_id?;
    IssueType issue_type?;
    string title?;
    string description;
    string created_by;
    string created_at;
    int timestamp;
    boolean status?;
    int views;
    string tags;
    float similarityScore?;
|};

public type IssueContentUpdate record {|
    string parent_id?;
    IssueType issue_type?;
    string title?;
    string description?;
    string created_by?;
    string created_at?;
    int timestamp?;
    boolean status?;
    int views?;
    int downVotes?;
    string tags?;
|};

public type IssueCreateRequest record {|
    string parent_id?;
    IssueType issue_type?;
    string title?;
    string description;
    string created_by;
    string token;
    string[] tags;
|};

public type IssueUpdateRequest record {|
    string id;
    string token;
    string title?;
    boolean status?;
    boolean watched?;
    string description?;
    string[] tags?;
|};

public type IssueGetRequest record {|
    string id?;
    string parent_id?;
    IssueType issue_type?;
    string created_by?;
    string created_at?;
    boolean status?;
    string[] tags?;
    string token?;
|};

public type IssueFilterRequest record {|
    string description;
    boolean status?;
    string created_by?;
    string[] tags;
    string token;
|};

public type IssueDeleteRequest record {|
    string token;
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

public type User readonly & record {
    string name;
    string role;
};



