// src/App.js
import React, { useState , useEffect } from 'react';
import { BrowserRouter as Router, Routes,Route , useNavigate } from 'react-router-dom';
import CreateIssue from '../components/ CreateIssue';
import IssueList from '../components/IssueList';
import { useUser } from '../components/UserProvider';
import { getIssues } from '../api';

function CreateIssuePage() {
  const navigate = useNavigate();
  const [issues, setIssues] = useState([]);
  const  {userName, setUsername, token, setToken  } = useUser();

  useEffect(() => {
    fetchIssue();
  }, []);

  const fetchIssue = async () => {
    try {
      const issueResponse = await getIssues({issue_type: 'ISSUE' , created_by: userName , token : token});
      setIssues(issueResponse.data);
    } catch (error) {
      console.error('Error fetching issue details:', error);
    }
  };


  const handleBackToList = () => {
    navigate(-1);
  };

  return (

      <div style={styles.container}>
        <header style={styles.header}>
          <h1>Problem Tracker</h1>
        </header>

        <main style={styles.mainContent}>
            <CreateIssue onBack={handleBackToList} onSubmit={fetchIssue} />
            <h2>Questions I Asked</h2>
            <IssueList issues={issues} deletePostFunction={fetchIssue}/>
          
        </main>
      </div>
  );
}

// **Styling for the new simplified layout**
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
  askButton: {
    backgroundColor: '#007bff',
    color: '#fff',
    border: 'none',
    padding: '10px 15px',
    borderRadius: '5px',
    cursor: 'pointer',
    fontSize: '16px',
  },
  mainContent: {
    marginTop: '20px',
  },
};

export default CreateIssuePage;