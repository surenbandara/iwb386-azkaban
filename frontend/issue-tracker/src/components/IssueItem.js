import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { updateIssue, deleteIssue } from '../api'; // Import the delete function
import { FaEye, FaCheckCircle, FaTrash } from 'react-icons/fa'; // Import the delete icon
import { useUser } from './UserProvider';

function IssueItem({ issue, deletePostFunction }) {
  const [showConfirm, setShowConfirm] = useState(false);
  const  {userName, setUsername, token, setToken  } = useUser();

  const handleToggle = async () => {
    await updateIssue(issue.id, { id: issue.id, watched: true,  token: token});
  };

  const handleDelete = async () => {
    await deleteIssue(issue.id, {token : token});
    await deletePostFunction();
    setShowConfirm(false);
  };

  return (
    <div className="issue-item" style={styles.container}>
      <div style={styles.votesSection}>
        <div style={styles.voteItem}>
          <p style={styles.createdDate}>Views</p>
          <span style={styles.voteCount}>{issue.views}</span>
          {issue.isResolved && <FaCheckCircle style={styles.solvedIcon} />}
        </div>

        {issue.status && (
          <div style={styles.statusIndicator}>
            <FaCheckCircle style={styles.statusIcon} />
          </div>
        )}
      </div>

      <div style={styles.contentSection}>
        <h3 onClick={handleToggle} style={styles.title}>
          <Link to={`/${issue.id}`} style={{ color: '#007bff', textDecoration: 'none' }}>
            {issue.title}
          </Link>
        </h3>
        <p style={styles.description}>
          {issue.description.length > 100 ? `${issue.description.substring(0, 100)}...` : issue.description}
        </p>
        <p style={styles.createdBy}>
          Created by: {issue.created_by}
        </p>
        <div style={styles.tagsContainer}>
          {issue.tags !== "" && issue.tags.split("|").map((tag) => (
            <span key={tag} style={styles.tag}>
              {tag}
            </span>
          ))}
          <p style={styles.createdDate}>Created at: {issue.created_at}</p>
        </div>
      </div>

      {/* Delete Icon */}
      {issue.created_by === userName && (
        <div style={styles.deleteIconContainer}>
          <FaTrash 
            style={styles.deleteIcon} 
            onClick={() => setShowConfirm(true)} 
          />
        </div>
      )}

      {/* Confirmation Popup */}
      {showConfirm && (
        <div style={styles.confirmationPopup}>
          <p style={styles.popupText}>Are you sure you want to delete this issue?</p>
          <div style={styles.buttonContainer}>
            <button onClick={handleDelete} style={styles.confirmButton}>Yes</button>
            <button onClick={() => setShowConfirm(false)} style={styles.cancelButton}>No</button>
          </div>
        </div>
      )}
    </div>
  );
}

// **Styling for IssueItem Component**
const styles = {
  container: {
    display: 'flex',
    border: '1px solid #ccc',
    margin: '10px',
    padding: '10px',
    borderRadius: '5px',
    backgroundColor: '#f9f9f9',
    position: 'relative', // Add position relative for absolute elements
  },
  votesSection: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'flex-end',
    justifyContent: 'center',
    width: '50px',
    marginLeft: '30px',
    marginRight: '10px',
    marginBottom: '10px',
  },
  voteItem: {
    display: 'flex',
    alignItems: 'center',
    marginBottom: '5px',
  },
  voteCount: {
    fontSize: '12px',
    margin: '0 5px',
  },
  contentSection: {
    flexGrow: 1,
  },
  title: {
    color: '#007bff',
    cursor: 'pointer',
    margin: '5px 0',
    fontSize: '18px',
    fontWeight: 'bold',
  },
  createdBy: {
    margin: '3px 0',
    lineHeight: '1.5',
    fontSize: '12px',
    color: '#555',
  },
  description: {
    margin: '3px 0',
    lineHeight: '1.5',
    fontSize: '14px',
  },
  createdDate: {
    fontSize: '12px',
    color: '#555',
    marginLeft: 'auto',
  },
  tagsContainer: {
    margin: '5px 0',
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'flex-end',
  },
  tag: {
    backgroundColor: '#e0e0e0',
    color: 'black',
    fontWeight: 'bold',
    borderRadius: '5px',
    padding: '3px 8px',
    margin: '3px',
    fontSize: '14px',
  },
  solvedIcon: {
    color: 'green',
    fontSize: '16px',
    marginLeft: '5px',
  },
  statusIndicator: {
    display: 'flex',
    alignItems: 'center',
    marginTop: '1px',
  },
  statusIcon: {
    color: 'green',
    fontSize: '16px',
    marginRight: '5px',
  },
  deleteIconContainer: {
    position: 'absolute', // Position delete icon absolutely within container
    top: '10px', // Adjust top position as needed
    right: '10px', // Adjust right position as needed
  },
  deleteIcon: {
    color: 'red',
    cursor: 'pointer',
    fontSize: '18px',
  },
  confirmationPopup: {
    position: 'absolute',
    top: '50%', // Center vertically
    left: '50%', // Center horizontally
    transform: 'translate(-50%, -50%)', // Adjust position
    backgroundColor: '#ffffff', // Change background color
    padding: '20px',
    border: '1px solid #ccc',
    borderRadius: '8px',
    zIndex: 1000, // Ensure it appears above other elements
    boxShadow: '0 4px 8px rgba(0, 0, 0, 0.2)', // Add shadow
  },
  popupText: {
    marginBottom: '15px',
    fontSize: '16px', // Increase font size for better readability
  },
  buttonContainer: {
    display: 'flex',
    justifyContent: 'space-between',
  },
  confirmButton: {
    backgroundColor: '#28a745', // Green color for Yes button
    color: 'white',
    border: 'none',
    borderRadius: '5px',
    padding: '10px 15px',
    cursor: 'pointer',
    fontSize: '16px',
    marginRight: '5px',
    transition: 'background-color 0.3s',
  },
  cancelButton: {
    backgroundColor: '#dc3545', // Red color for No button
    color: 'white',
    border: 'none',
    borderRadius: '5px',
    padding: '10px 15px',
    cursor: 'pointer',
    fontSize: '16px',
    transition: 'background-color 0.3s',
  },
  confirmButtonHover: {
    backgroundColor: '#218838', // Darker green on hover
  },
  cancelButtonHover: {
    backgroundColor: '#c82333', // Darker red on hover
  },
};

// Adding hover styles directly to buttons
styles.confirmButton.onMouseOver = () => {
  styles.confirmButton.backgroundColor = '#218838'; // Darker green on hover
};
styles.cancelButton.onMouseOver = () => {
  styles.cancelButton.backgroundColor = '#c82333'; // Darker red on hover
};

export default IssueItem;
