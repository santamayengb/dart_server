#!/bin/bash

# Run dart_frog build
# dart_frog build

# Change directory to build
cd build

# Build Docker image
docker build -t dart_server .

# Tag the Docker image
docker tag dart_server:latest santamayengb/dart_server:1.0.3

# Push the Docker image to the registry
docker push santamayengb/dart_server:1.0.3
