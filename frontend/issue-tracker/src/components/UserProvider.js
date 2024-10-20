import React, { createContext, useContext, useState, useEffect } from 'react';

const UserContext = createContext();

export const useUser = () => useContext(UserContext);

const generateRandomNumber = () => Math.floor(100000 + Math.random() * 900000).toString(); 

export const UserProvider = ({ children }) => {
  const [userName, setUserName] = useState(null);
  const [token, setToken] = useState(null);

  useEffect(() => {
    const randomNumber = generateRandomNumber(); 
    setUserName(randomNumber); 
    console.log('Generated User Name:', randomNumber); 
  }, []); 

  return (
    <UserContext.Provider value={{ userName, setUserName, token, setToken }}>
      {children}
    </UserContext.Provider>
  );
};

