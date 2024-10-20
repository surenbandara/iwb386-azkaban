// src/App.js
import React, { useState } from 'react';
import { BrowserRouter as Router, Routes,Route , useNavigate } from 'react-router-dom';
import IssueDetailPage from './pages/IssueDetailsPage';
import Home from './pages/Home';
import CreateIssuePage from './pages/CreateIssuePage';
import { UserProvider } from './components/UserProvider';
import LoginPage from './pages/LoginPage';
import { Navigate } from 'react-router-dom';

function App() {

  return (
    <UserProvider> 
      <Router>
        <Routes>
          <Route path='/home' element={<Home/>}/>
          <Route path='/login' element={<LoginPage/>}/>
          <Route path="/create" element={<CreateIssuePage/>} />
          <Route path="/:id" element={<IssueDetailPage />} />
          <Route path="/" element={<Navigate to="/login" replace />} />
        </Routes>
      </Router>
    </UserProvider>
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

export default App;