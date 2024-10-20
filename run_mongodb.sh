#!/bin/bash

CONTAINER_NAME="mongodb-container"
MONGO_IMAGE="mongo:latest"
DB_NAME="main"

if [ "$(sudo docker ps -q -f name=$CONTAINER_NAME)" ]; then
  echo "MongoDB container is already running."
  exit 0
fi

sudo docker run -d --name $CONTAINER_NAME -p 27017:27017 $MONGO_IMAGE

echo "Waiting for MongoDB to start..."
sleep 10

echo "Creating database '$DB_NAME'..."
sudo docker exec -it $CONTAINER_NAME mongosh --eval "use $DB_NAME; db.createCollection('tag');"
sudo docker exec -it $CONTAINER_NAME mongosh --eval "use $DB_NAME; db.createCollection('issue');"

echo "Database '$DB_NAME' created successfully."
