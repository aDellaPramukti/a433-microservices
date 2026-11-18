
#!/bin/bash
set -e

# Check Docker Hub password environment variable
if [ -z "$PASSWORD_DOCKER_HUB" ]; then
  echo "Error: PASSWORD_DOCKER_HUB environment variable is not set."
  exit 1
fi

# Build the application Docker image
docker build -t item-app:v1 .

# List available local Docker images
docker images

# Tag the image for Docker Hub
docker tag item-app:v1 dellaraharjo/item-app:v1

# Login to Docker Hub securely
echo "$PASSWORD_DOCKER_HUB" | docker login -u dellaraharjo --password-stdin

# Push the image to Docker Hub
docker push dellaraharjo/item-app:v1
