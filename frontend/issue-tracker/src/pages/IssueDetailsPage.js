import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { getIssues, updateIssue, createIssue } from '../api';
import { FaCheckCircle, FaExclamationCircle } from 'react-icons/fa';
import Comment from '../components/Comment';
import { useUser } from '../components/UserProvider';
import ReactMarkdown from 'react-markdown';

function IssueDetailPage() {
  const { id } = useParams();
  const  {userName, setUsername, token, setToken  } = useUser();
  const [issue, setIssue] = useState(null);
  const [comments, setComments] = useState([]);
  const [newComment, setNewComment] = useState('');
  const [isSolved, setIsSolved] = useState(false);

  useEffect(() => {
    fetchIssue();
  }, [id]);

  const fetchIssue = async () => {
    try {
      const issueResponse = await getIssues({ id , token: token });
      const commentsResponse = await getIssues({ parent_id: id, token: token });

      setIssue(issueResponse.data[0]);
      setComments(commentsResponse.data || []);
      setIsSolved(issueResponse.data[0].status);
    } catch (error) {
      console.error('Error fetching issue details:', error);
    }
  };

  const handleCommentSubmit = async () => {
    await createIssue({
      description: newComment,
      parent_id: issue.id,
      tags: issue.tags.split("|"),
      issue_type: "COMMENT",
      created_by: userName,
      token: token 
    });
    const response = await getIssues({ parent_id: issue.id, token: token });
    setComments(response.data || []);
    setNewComment('');
  };

  const handleToggleSolved = async () => {
    try {
      const updatedStatus = !isSolved;
      setIsSolved(updatedStatus);

      await updateIssue(id, { id, status: updatedStatus, token: token  });

      console.log(`Issue marked as ${updatedStatus ? 'solved' : 'unsolved'}`);
    } catch (error) {
      console.error('Error updating issue status:', error);
      setIsSolved((prev) => !prev);
    }
  };

  if (!issue) return <div>Loading...</div>;

  return (
    <div style={styles.container}>
      <header style={styles.header}>
        <h1>Problem Tracker</h1>
      </header>

      <main style={styles.mainContent}>
        <div style={styles.titleContainer}>
          <div style={styles.viewsContainer}>
            <h2 style={styles.title}>{issue.title}</h2>
          </div>
          <div style={styles.titleInfo}>
            {isSolved ? (
              <FaCheckCircle style={{ ...styles.statusIcon, color: 'green' }} title="Solved" />
            ) : (
              <FaExclamationCircle style={styles.statusIcon} title="Still Not Solved" />
            )}
            <p style={styles.createdDate}>Created by: {issue.created_by} | Created at: {issue.created_at} | views: {issue.views}</p>
            {userName === issue.created_by && (
              <label style={styles.toggleLabel}>
                <input
                  type="checkbox"
                  checked={isSolved}
                  onChange={handleToggleSolved}
                  style={styles.toggleSwitch}
                />
                {isSolved ? 'Solved' : 'Mark as Solved'}
              </label>
            )}
          </div>
        </div>

        <div style={styles.combinedSection}>
          <div style={styles.rightSection}>
            <ReactMarkdown style={styles.description}>{issue.description}</ReactMarkdown>
            <div style={styles.tagsContainer}>
              {issue.tags?.split('|').map((tag) => (
                <span key={tag} style={styles.tag}>{tag}</span>
              ))}
            </div>
          </div>
        </div>

        {/* Comment Input Section */}
        <div style={styles.commentInputContainer}>
          <textarea
            type="text"
            value={newComment}
            onChange={(e) => setNewComment(e.target.value)}
            placeholder="Add a comment"
            style={styles.commentInput}
          />
          
        </div>
        <button onClick={handleCommentSubmit} style={styles.submitButton}>
            Submit
          </button>

        {/* Markdown Preview - only show if there is a new comment */}
        {newComment && (
          <div style={styles.markdownPreviewContainer}>
            <h4 style={styles.previewTitle}>Comment Preview:</h4>
            <ReactMarkdown>{newComment}</ReactMarkdown>
          </div>
        )}

        {/* Comments Section */}
        <section style={styles.commentsSection}>
          <h3 >Comments ({comments.length})</h3>
          {comments.length > 0 ? (
            comments.map((comment) => (
              <Comment key={comment.id} comment={comment} />
            ))
          ) : (
            <p>No comments available.</p>
          )}
        </section>
      </main>
    </div>
  );
}

const styles = {
  container: {
    maxWidth: '1200px',
    margin: '0 auto',
    padding: '20px',
    fontFamily: 'Arial, sans-serif',
  },
  header: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: '20px',
    borderBottom: '2px solid #e1e1e1',
    paddingBottom: '10px',
  },
  mainContent: {
    marginTop: '20px',
  },
  titleContainer: {
    marginBottom: '5px',
  },
  title: {
    fontSize: '24px',
    color: '#333',
    marginBottom: '1px'
  },
  titleInfo: {
    display: 'flex',
    alignItems: 'center',
    marginTop: '0px',
    gap: '1px',
    flexWrap: 'wrap'
  },
  statusIcon: {
    fontSize: '18px',
    marginRight: '10px',
  },
  createdDate: {
    fontSize: '14px',
    color: '#666',
    marginRight: '10px',
  },
  toggleLabel: {
    display: 'flex',
    alignItems: 'center',
    marginLeft: 'auto',
  },
  toggleSwitch: {
    marginRight: '5px',
  },
  combinedSection: {
    display: 'flex',
    alignItems: 'flex-start',
    marginTop: '5px',
  },
  viewsContainer: {
    display: 'flex',
    alignItems: 'center',
    marginRight: '20px',
  },
  viewsStyle: {
    fontSize: '16px',
    color: '#333',
  },
  rightSection: {
    flex: 1,
    display: 'flex',
    flexDirection: 'column',
    marginLeft: '10px',
  },
  description: {
    marginBottom: '10px',
  },
  tagsContainer: {
    marginTop: '10px',
  },
  tag: {
    backgroundColor: '#e0e0e0',
    borderRadius: '5px',
    padding: '3px 8px',
    margin: '3px',
  },
  commentInput: {
    flex: 1,
    padding: '10px',
    marginRight: '5px',
    height: '100px',
    borderRadius: '4px',
    border: '1px solid #ccc',
  },
  submitButton: {
    padding: '8px 10px',  // Reduced padding for smaller size
    backgroundColor: '#007bff',
    color: '#fff',
    border: 'none',
    borderRadius: '4px',
    cursor: 'pointer',
    width: '100px',  // Reduced width
    textAlign: 'center',
    fontWeight: 'bold',
    fontSize: '14px',  // Reduced font size
  },

  commentInputContainer: {
    display: 'flex',
    marginTop: '20px',
    marginBottom: '10px',
    gap: '10px',  // Adjust spacing between the input and button
  },
  
  markdownPreviewContainer: {
    marginTop: '10px',
    padding: '10px',
    border: '1px solid #ccc',
    borderRadius: '4px',
    backgroundColor: '#f9f9f9',
  },
  commentsSection: {
    marginTop: '20px',
    padding: '20px',
    border: '1px solid #e1e1e1',
    borderRadius: '8px',
    backgroundColor: '#f9f9f9',
  },
  previewTitle: {
    marginBottom: '10px',
    fontSize: '15px',
    color : '#8f6da8'
  },
};

export default IssueDetailPage;
