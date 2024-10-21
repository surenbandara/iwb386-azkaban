# IWB386-Azkaban Project

## Overview
Project involves setting up and running multiple services, including MongoDB, backend, authentication, and frontend. The provided `build_and_deploy.sh` script simplifies starting all services at once.

---

## Prerequisites
Make sure you have the following installed:

- **Docker**: For running MongoDB in a container.
- **Ballerina**: To run backend and authentication services.
- **Node.js & npm**: To install and run the frontend.

---

## Setup & Instructions

### 1. Run All Services Using `build_and_deploy.sh`
A shell script is provided to start all services (MongoDB, backend, authenticator, and frontend) with a single command.

#### Instructions:


1. Make the script executable by running:

    ```bash
    chmod +x build_and_deploy.sh
    ```

2. Run the script using:

    ```bash
    ./build_and_deploy.sh
    ```

3. Press **Enter** to stop all services when you are done.
---

## Manual Commands (Optional)
If you prefer to run the services manually, use the commands below.

### Start MongoDB
```bash
./run_mongodb.sh

### Start Backend Server
```bash
cd backend/
bal run


### Start Authenticator Service
```bash
cd authenticator/
bal run


###Start Frontend in Development Mode
```bash
cd frontend/
npm run dev

