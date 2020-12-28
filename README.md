# Sandbox Docker-based Development Environment

Example, docker-based development environment for x86 platform.
It's based on the [DDEN](https://hub.docker.com/repository/docker/psugrg/dden/general)
infrastructure wchich means that it derives from DDEN and it expects to be
derived by the [DUSET](https://github.com/psugrg/duset) in order to create
an image with local user rights for installation.

It contains example of X11 forwarding using `DOCKER_CREATE_EXTRA` and
`DOCKER_START_EXTRA` variables processed by `DDEN`.

## Compilation

Run

```bash
docker image build \
--build-arg USER_ID=$(id -u ${USER}) \
--build-arg GROUP_ID=$(id -g ${USER}) \
--build-arg USER_NAME=${USER} \
--build-arg GROUP_NAME=${USER} \
-t saden \
.
```

## Deployment

Compiled image can be stored in `docker registry` or `docker hub` where it
can be accessed by developers who want to install it via the DUSET image.

## Installation

Follow the instructions in DUSET in order to install this environment. Use
`saden` as a name of the base image `<image-name>`.
