# Use an official DDEN as a base image
FROM psugrg/dden:latest

# Set Development Environment name
ENV IMAGE_NAME="saden"

RUN apt-get update && apt-get install -y \
    gcc \
    cmake 
