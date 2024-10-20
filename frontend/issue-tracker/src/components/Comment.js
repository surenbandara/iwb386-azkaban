import React from 'react';
import ReactMarkdown from 'react-markdown';

function Comment({ comment }) {
  return (
    <div style={styles.commentBubble}>
      {/* Render Markdown in the description */}
      <ReactMarkdown>{comment.description}</ReactMarkdown>

      <p style={styles.commentDate}>
        <small>Created at: {comment.created_at}</small>
      </p>
      <small style={styles.commentedBy}>
        Commented by: {comment.created_by}
      </small>
    </div>
  );
}

// Updated styling for bubble-like appearance
const styles = {
  commentBubble: {
    backgroundColor: '#e6f7ff',
    borderRadius: '20px',
    padding: '15px 20px',
    marginBottom: '15px',
    position: 'relative',
    boxShadow: '0 2px 5px rgba(0, 0, 0, 0.1)',
    maxWidth: '100%', // Controls bubble width
    wordBreak: 'break-word',
  },
  commentDate: {
    position: 'absolute',
    bottom: '5px',
    right: '10px',
    fontSize: '12px',
    color: '#666',
  },
  commentedBy: {
    display: 'block',
    color: '#5d67b3',
    fontSize: '12px',
    marginTop: '10px',
    fontWeight: 'bold',
  },
};

export default Comment;
