// src/api.js
import axios from 'axios';

const API_BASE_URL = 'http://localhost:9091/api';
const AUTH_BASE_URL = 'http://localhost:9090/auth';

export const createIssue = async (issueData) =>
  await axios.post(`${API_BASE_URL}/issue`, issueData);

export const updateIssue = async (issueId, updateData) =>
  await axios.put(`${API_BASE_URL}/update`, updateData);

export const getIssues = async (filter = {}) =>
  await axios.post(`${API_BASE_URL}/issues`, filter);

export const deleteIssue = async (issueId, body = {}) =>
  await axios.delete(`${API_BASE_URL}/issues/${issueId}`,body );

export const filterIssues = async (filterData) =>
  await axios.post(`${API_BASE_URL}/filter`, filterData);

export const login = async (loginBody) =>
  await axios.post(`${AUTH_BASE_URL}/login`, loginBody);

export const signUp = async (signUpBody) =>
  await axios.post(`${AUTH_BASE_URL}/signUp`, signUpBody);

