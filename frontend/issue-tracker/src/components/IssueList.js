// src/components/IssueList.js
import React from 'react';
import IssueItem from './IssueItem';

function IssueList({ issues , deletePostFunction }) {
  if (!Array.isArray(issues)) {
    console.error('Expected issues to be an array, but got:', issues);
    return <p>No issues found or invalid data.</p>;
  }

  return (
    <div>
      {issues.length > 0 ? (
        issues.map((issue) => <IssueItem key={issue.id} issue={issue} deletePostFunction={deletePostFunction}/>)
      ) : (
        <p>No questions found</p>
      )}
    </div>
  );
}

export default IssueList;

