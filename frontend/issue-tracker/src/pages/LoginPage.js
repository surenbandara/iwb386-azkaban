// src/Login.js
import React, { useState } from 'react';
import { login } from '../api';
import { useUser } from '../components/UserProvider';
import { BrowserRouter as Router, Routes,Route , useNavigate } from 'react-router-dom';

function LoginPage() {
  const [nameInput, setUsernameInput] = useState('');
  const [password, setPassword] = useState('');
  const  {userName, setUsername, token, setToken  } = useUser();
  const navigate = useNavigate();


  const handleLogin = (e) => {
    e.preventDefault();
    signIn();
  };

  const signIn = async () => {
    try {
        console.log("login")
        const loginResponse = await login({name: nameInput,password: password});
        console.log(loginResponse);
        if(loginResponse.data.status == true){
            console.log(loginResponse);
            setToken(loginResponse.data.token);
            navigate('/home');
        }
    } catch (error) {
      console.error('Error fetching issue details:', error);
    }
  };

  return (
    <div style={styles.container}>
      <h2 style={{ textAlign: 'center', marginBottom: '20px' }}>Login</h2>
      <form onSubmit={handleLogin}>
        <div style={styles.inputGroup}>
          <label htmlFor="username" style={styles.label}>
            Username:
          </label>
          <input
            type="text"
            id="nameInput"
            value={nameInput}
            onChange={(e) => setUsernameInput(e.target.value)}
            placeholder="Enter your username"
            required
            style={styles.input}
          />
        </div>

        <div style={styles.inputGroup}>
          <label htmlFor="password" style={styles.label}>
            Password:
          </label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            placeholder="Enter your password"
            required
            style={styles.input}
          />
        </div>

        <button
          type="submit"
          style={styles.button}
          onMouseOver={(e) =>
            (e.target.style.backgroundColor = styles.buttonHover.backgroundColor)
          }
          onMouseOut={(e) =>
            (e.target.style.backgroundColor = styles.button.backgroundColor)
          }
        >
          Login
        </button>
      </form>
    </div>
  );
}

// Define styles outside the component
const styles = {
    container: {
      width: '300px',
      margin: '100px auto',
      padding: '20px',
      boxShadow: '0px 0px 10px rgba(0, 0, 0, 0.1)',
      borderRadius: '8px',
      backgroundColor: '#f9f9f9',
    },
    inputGroup: {
      marginBottom: '15px',
    },
    label: {
      display: 'block',
      marginBottom: '5px',
    },
    input: {
      width: '100%',
      padding: '8px',
      marginTop: '4px',
      border: '1px solid #ccc',
      borderRadius: '4px',
    },
    button: {
      width: '100%',
      padding: '10px',
      backgroundColor: '#4CAF50',
      color: 'white',
      border: 'none',
      borderRadius: '4px',
      cursor: 'pointer',
    },
    buttonHover: {
      backgroundColor: '#45a049',
    },
  };
  

export default LoginPage;
