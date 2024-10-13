#!/bin/bash

# Set MongoDB container name, image, and DB name
CONTAINER_NAME="mongodb-container"
MONGO_IMAGE="mongo:latest"
DB_NAME="main"

# Check if the container is already running
if [ "$(sudo docker ps -q -f name=$CONTAINER_NAME)" ]; then
  echo "MongoDB container is already running."
  exit 0
fi

# Run MongoDB container with port mapping
sudo docker run -d --name $CONTAINER_NAME -p 27017:27017 $MONGO_IMAGE

# Wait for MongoDB to initialize
echo "Waiting for MongoDB to start..."
sleep 10

# Create the database
echo "Creating database '$DB_NAME'..."
sudo docker exec -it $CONTAINER_NAME mongosh --eval "use $DB_NAME; db.createCollection('init');"

echo "Database '$DB_NAME' created successfully."
