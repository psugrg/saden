# Use an official DDEN as a base image
FROM psugrg/dden:latest

# Set Development Environment name
ENV IMAGE_NAME="saden"

# Set timezone. It's required by lots of packages. 
# It's also better than setting DEBIAN_FRINTEND=noninteractive since, in dev-environment
# somtimes interactive tools are needed.
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install packages
RUN apt-get update && apt-get install -y \
    make \
    cmake \
    g++ \
    gcc \
    gdb \
    clang \
    clang-format \
    clang-tidy \
    clang-tools \
    cppcheck \
    googletest \
    doxygen \
    graphviz \
    python3 \
    python3-pip \
    wget 

# Istall Gcovr gcov data presentation tool
# https://github.com/gcovr/gcovr
RUN pip3 install gcovr

# Set shell variable
ENV SHELL=/usr/bin/bash
