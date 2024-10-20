import React, { useState } from 'react';
import { filterIssues } from '../api';
import { FaSearch, FaFilter } from 'react-icons/fa';
import { useUser } from './UserProvider';

function SearchBar({ onSearch }) {
  const [description, setDescription] = useState('');
  const [tags, setTags] = useState([]);
  const [tagInput, setTagInput] = useState('');
  const [error, setError] = useState('');
  const  {userName, setUsername, token, setToken  } = useUser();

  const handleSearch = async () => {
    if (!description.trim()) {
        setError('Description is required!'); 
        return; 
    }
    setError(''); 

    console.log('Performing search...');

    const filter = { description, tags: [], token: token};
    
    const statusKeywords = ['resolved', 'unsolved'];
    let createdBy = null;
    let status = null; // Default to null for unset status

    tags.forEach((tag) => {
        if (tag.startsWith('created_by:')) {
            createdBy = tag.split(':')[1].trim(); 
        } else if (statusKeywords.includes(tag.toLowerCase())) {
            // Set status based on the tag
            if (tag.toLowerCase() === 'resolved') {
                status = true; // Set to true for resolved
            } else if (tag.toLowerCase() === 'unsolved') {
                status = false; // Set to false for unsolved
            }
        } else {
            // Add other tags to the filter
            filter.tags.push(tag); // Directly add tag to filter.tags
        }
    });

    // Set filter properties based on processed values
    if (createdBy) filter.created_by = createdBy;
    if (status !== null) filter.status = status; // Only add if status is set

    try {
        const response = await filterIssues(filter);
        console.log('API Response:', response);

        const data = typeof response.data === 'string'
            ? JSON.parse(response.data)
            : response.data;

        onSearch(data || []);
    } catch (error) {
        console.error('Search failed:', error);
        onSearch([]);
    }
};


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

  return (
    <div style={styles.searchBarContainer}>
      <div style={styles.searchSection}>
        <input
          type="text"
          placeholder="Search by Description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          style={styles.descriptionInput}
        />
        <span style={styles.requiredIndicator}>* Required</span> {/* Required indicator */}
        <FaSearch
          onClick={handleSearch}
          style={styles.searchIcon}
        />
      </div>
      {error && <p style={styles.errorMessage}>{error}</p>} {/* Display error message */}

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
    </div>
  );
}

// **Styles for the SearchBar**
const styles = {
  searchBarContainer: {
    display: 'flex',
    flexDirection: 'column',
    width: '100%',
    alignItems: 'flex-start',
  },
  searchSection: {
    display: 'flex',
    alignItems: 'center',
    width: '100%',
    marginBottom: '10px',
    position: 'relative', // For positioning the required indicator
  },
  requiredIndicator: {
    color: 'black',
    fontSize: '14px',
    position: 'absolute', // Positioning it at the top right
    right: '0',
    top: '-20px', // Adjust as needed to position above the input
  },
  descriptionInput: {
    flexGrow: 1,
    padding: '10px',
    border: '1px solid #ccc',
    borderRadius: '5px',
    fontSize: '16px',
    marginRight: '10px', // Space for the search icon
  },
  searchIcon: {
    cursor: 'pointer',
    color: '#007bff',
    fontSize: '20px',
  },
  tagsContainer: {
    display: 'flex',
    flexWrap: 'wrap',
  },
  tag: {
    backgroundColor: '#4CAF50', // Green color for tags
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
  errorMessage: {
    color: 'red',
    fontSize: '14px',
    marginTop: '5px', // Space between the input and error message
  },
};

export default SearchBar;
