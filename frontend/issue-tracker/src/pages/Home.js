// src/App.js
import React, { useState , useEffect } from 'react';
import { BrowserRouter as Router, Routes,Route , useNavigate } from 'react-router-dom';
import { getIssues } from '../api';
import SearchBar from '../components/SearchBar';
import IssueList from '../components/IssueList';
import { useUser } from '../components/UserProvider';

function Home() {
  const [issues, setIssues] = useState([]);
  const navigate = useNavigate();
  const  {userName, setUsername, token, setToken  } = useUser();

  useEffect(() => {
    fetchIssue();
  }, []);

  const fetchIssue = async () => {
    try {
      const issueResponse = await getIssues({issue_type: 'ISSUE' , token: token});
      setIssues(issueResponse.data);
    } catch (error) {
      console.error('Error fetching issue details:', error);
    }
  };
  const handleSearch = (results) => {
    setIssues(results);
  };

  const handleAskQuestionClick = () => {
    navigate(`/create`);
  };



  return (

         <div style={styles.container}>
         <header style={styles.header}>
           <h1>Problem Tracker</h1>
        
             <button style={styles.askButton} onClick={handleAskQuestionClick}>
               Ask Question
             </button>
           
         </header>
 
         <main style={styles.mainContent}>
             <>
               <SearchBar onSearch={handleSearch} />
               <h2>Problems ({issues.length})</h2>
               <IssueList issues={issues} deletePostFunction={fetchIssue} />
             </>
           
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

export default Home;