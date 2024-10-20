import React, { createContext, useContext, useState, useEffect } from 'react';

const UserContext = createContext();

export const useUser = () => useContext(UserContext);

export const UserProvider = ({ children }) => {
  const [userName, setUserName] = useState(null);
  const [token, setToken] = useState(null);


  return (
    <UserContext.Provider value={{ userName, setUserName, token, setToken }}>
      {children}
    </UserContext.Provider>
  );
};

