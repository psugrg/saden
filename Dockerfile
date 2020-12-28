# Use an official DDEN as a base image
FROM psugrg/dden:latest

# Set Development Environment name
ENV IMAGE_NAME="saden"

# Enable X11 forwarding by using the DDEN DOCKER_CREATE_EXTRA variable. 
# The content of this variable is called during the docker create action.
ENV DOCKER_CREATE_EXTRA="-e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \ 
    -v /tmp/.docker.xauth:/tmp/.docker.xauth:rw -e XAUTHORITY=/tmp/.docker.xauth \
    --privileged -v /dev/bus/usb:/dev/bus/usb"

# Enable X11 forwarding by using the DDEN DOCKER_START_EXTRA variable. 
# The content of this variable is called during the docker start action.
ENV DOCKER_START_EXTRA="xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f /tmp/.docker.xauth nmerge -"

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

