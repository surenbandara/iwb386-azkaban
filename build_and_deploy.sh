#!/bin/bash

echo "Starting MongoDB..."
./run_mongodb.sh &
MONGO_PID=$!
echo "MongoDB is running with PID $MONGO_PID"

echo "Starting Backend Server..."
cd backend/ || exit
bal run &
BACKEND_PID=$!
echo "Backend Server is running with PID $BACKEND_PID"
cd ..

echo "Starting Authenticator Service..."
cd authenticator/ || exit
bal run &
AUTH_PID=$!
echo "Authenticator Service is running with PID $AUTH_PID"
cd ..

echo "Starting Frontend in Development Mode..."
cd frontend/ || exit
npm run dev &
FRONTEND_PID=$!
echo "Frontend is running with PID $FRONTEND_PID"
cd ..

read -p "Press [Enter] to stop all services..."

echo "Stopping all services..."
kill $MONGO_PID $BACKEND_PID $AUTH_PID $FRONTEND_PID

echo "All services stopped."
