# Use an official DDEN as a base image
FROM psugrg/dden:latest

# Set Development Environment name
ENV IMAGE_NAME="saden"

# Set timezone for the tzdata package (It's usually installed as a dependency for other packages)
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install packages
RUN apt-get update && apt-get install -y \
    make \
    cmake \
    gcc 
