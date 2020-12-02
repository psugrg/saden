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

# Add user 

# Default values for the user and group
ARG USER_ID
ARG USER_NAME=user
ARG GROUP_ID
ARG GROUP_NAME=user

# Add new user
RUN groupadd -g ${GROUP_ID} ${GROUP_NAME} &&\
    useradd -l -u ${USER_ID} -g ${GROUP_NAME} ${USER_NAME} &&\
    install -d -m 0755 -o ${USER_NAME} -g ${GROUP_NAME} /home/${USER_NAME}

# Normally you woldn't add a docer user to the sudo group since a docer should be 
# a complete environment and adding anything in a runtime (apt get) is not a good idea. 
# Here hovewere the contaier is not ment to be used in production but is rather an example and/or a handfull tool to use when needed. 
# For this reason adding user to the sudo group can be handfull.
RUN apt-get update && apt-get install -y apt-utils sudo
RUN echo ${USER_NAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers 

# Change user
USER ${USER_NAME} 
WORKDIR /home/${USER_NAME}
