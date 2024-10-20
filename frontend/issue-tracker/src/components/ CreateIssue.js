// src/components/CreateIssue.js
import React, { useState } from 'react';
import { createIssue } from '../api';
import { FaArrowLeft, FaCheckCircle, FaTimesCircle } from 'react-icons/fa';
import { ClipLoader } from 'react-spinners';
import { useUser } from './UserProvider';
import ReactMarkdown from 'react-markdown'; // Import ReactMarkdown

function CreateIssue({ onBack, onSubmit }) {
  const  {userName, setUsername, token, setToken  } = useUser();
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [tags, setTags] = useState([]);
  const [tagInput, setTagInput] = useState('');
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [popup, setPopup] = useState({ message: '', type: '', visible: false });
  const [errors, setErrors] = useState({ title: '', description: '' });

  const handleTagKeyPress = (e) => {
    if (e.key === 'Enter' && tagInput.trim()) {
      setTags((prevTags) => [...prevTags, tagInput.trim()]);
      setTagInput('');
    }
  };

  const handleTagDelete = (tagToDelete) => {
    const updatedTags = tags.filter((tag) => tag !== tagToDelete);
    setTags(updatedTags);
  };

  const handleSubmit = async () => {
    let hasError = false;
    const newErrors = { title: '', description: '' };

    if (!title) {
      newErrors.title = 'Title is required!';
      hasError = true;
    }
    if (!description) {
      newErrors.description = 'Description is required!';
      hasError = true;
    }

    setErrors(newErrors);
    if (hasError) return;

    const issueData = {
      created_by: userName,
      title,
      description,
      tags,
      issue_type: 'ISSUE',
      token: token 
    };

    setIsSubmitting(true);

    try {
      await createIssue(issueData);
      setPopup({ message: 'Issue created successfully!', type: 'success', visible: true });
      setTitle('');
      setDescription('');
      setTags([]);

      setTimeout(() => {
        setPopup((prev) => ({ ...prev, visible: false }));
        setIsSubmitting(false);
        onSubmit();
      }, 2000);
    } catch (error) {
      console.error('Error creating issue:', error);
      setPopup({ message: 'Issue creation failed. Please try again.', type: 'error', visible: true });

      setTimeout(() => {
        setPopup((prev) => ({ ...prev, visible: false }));
        setIsSubmitting(false);
        onSubmit();
      }, 2000);
    }
  };

  return (
    <div style={styles.container}>
      <div style={styles.header}>
        <FaArrowLeft style={styles.backIcon} onClick={onBack} />
        <h2 style={styles.title}>Ask a New Question</h2>
      </div>

      <input
        type="text"
        placeholder="Title (e.g., How do I implement a custom hook in React?)"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
        style={styles.input}
        required
      />
      {errors.title && <div style={styles.errorMessage}>{errors.title}</div>}

      <textarea
        placeholder="Describe your issue in detail..."
        value={description}
        onChange={(e) => setDescription(e.target.value)}
        style={styles.textarea}
        required
      />
      {errors.description && <div style={styles.errorMessage}>{errors.description}</div>}

      {description && (
        <div style={styles.previewContainer}>
          <h3 style={styles.previewTitle}>Description Preview:</h3>
          <ReactMarkdown>{description}</ReactMarkdown>
        </div>
      )}

      <div style={styles.tagsContainer}>
        {tags.map((tag) => (
          <div key={tag} style={styles.tag}>
            {tag}
            <span onClick={() => handleTagDelete(tag)} style={styles.deleteTag}>
              &times;
            </span>
          </div>
        ))}
        <input
          type="text"
          placeholder="Add tags (press Enter)"
          value={tagInput}
          onKeyPress={handleTagKeyPress}
          onChange={(e) => setTagInput(e.target.value)}
          style={styles.tagInput}
        />
      </div>

      <button
        onClick={handleSubmit}
        style={{
          ...styles.submitButton,
          backgroundColor: isSubmitting ? '#ccc' : '#007bff',
          cursor: isSubmitting ? 'not-allowed' : 'pointer',
        }}
        disabled={isSubmitting}
      >
        {isSubmitting ? <ClipLoader size={20} color="#fff" /> : 'Submit'}
      </button>

      {popup.visible && (
        <div
          style={{
            ...styles.popup,
            backgroundColor: popup.type === 'success' ? '#4CAF50' : '#f44336',
            opacity: popup.visible ? 1 : 0,
            transition: 'opacity 0.5s ease-in-out',
          }}
        >
          {popup.type === 'success' ? (
            <FaCheckCircle style={styles.popupIcon} />
          ) : (
            <FaTimesCircle style={styles.popupIcon} />
          )}
          {popup.message}
        </div>
      )}

    
      
    </div>
  );
}

// **Styling for CreateIssue Component**
const styles = {
  container: {
    maxWidth: '600px',
    margin: '0 auto',
    padding: '20px',
    border: '1px solid #e1e1e1',
    borderRadius: '8px',
    boxShadow: '0 0 10px rgba(0, 0, 0, 0.1)',
    backgroundColor: '#fff',
    position: 'relative',
  },
  header: {
    display: 'flex',
    alignItems: 'center',
    marginBottom: '20px',
  },
  backIcon: {
    fontSize: '24px',
    cursor: 'pointer',
    marginRight: '10px',
    color: '#007bff',
  },
  title: {
    fontSize: '24px',
    fontWeight: 'bold',
  },
  input: {
    width: '100%',
    padding: '10px',
    marginBottom: '5px',
    border: '1px solid #ccc',
    borderRadius: '4px',
  },
  textarea: {
    width: '100%',
    height: '100px',
    padding: '10px',
    marginBottom: '5px',
    border: '1px solid #ccc',
    borderRadius: '4px',
    resize: 'none',
  },
  tagsContainer: {
    display: 'flex',
    flexWrap: 'wrap',
    marginBottom: '15px',
  },
  tag: {
    backgroundColor: '#4CAF50',
    color: 'white',
    borderRadius: '5px',
    padding: '5px 10px',
    margin: '5px',
    display: 'flex',
    alignItems: 'center',
  },
  deleteTag: {
    marginLeft: '8px',
    cursor: 'pointer',
    fontWeight: 'bold',
  },
  tagInput: {
    padding: '5px',
    margin: '5px',
    border: '1px solid #ccc',
    borderRadius: '5px',
    flexGrow: 1,
  },
  submitButton: {
    width: '100%',
    padding: '10px',
    backgroundColor: '#007bff',
    color: '#fff',
    border: 'none',
    borderRadius: '4px',
    cursor: 'pointer',
    fontSize: '16px',
  },
  popup: {
    position: 'absolute',
    top: '20px',
    left: '50%',
    transform: 'translateX(-50%)',
    padding: '10px 20px',
    borderRadius: '8px',
    color: '#fff',
    display: 'flex',
    alignItems: 'center',
    gap: '10px',
    fontWeight: 'bold',
    boxShadow: '0 0 10px rgba(0, 0, 0, 0.1)',
  },
  popupIcon: {
    fontSize: '20px',
  },
  errorMessage: {
    color: 'red',
    fontSize: '12px',
    marginBottom: '5px',
  },
  previewContainer: {
    marginTop: '20px',
    border: '1px solid #ccc',
    borderRadius: '5px',
    padding: '10px',
    backgroundColor: '#f9f9f9',
  },
  previewTitle: {
    marginBottom: '10px',
    fontSize: '15px',
    color : '#8f6da8'
  },
};

export default CreateIssue;
