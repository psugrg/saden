# Sandbox Docker-based Development Environment 
Sa-d-en is a Sandbox Docker-based development Environment created to test and play with implementation of the [Docker based Development Environment](https://hub.docker.com/repository/docker/psugrg/dden/general).

## Compilation
Run

```
docker image build \
--build-arg USER_ID=$(id -u ${USER}) \
--build-arg GROUP_ID=$(id -g ${USER}) \
--build-arg USER_NAME=${USER} \
--build-arg GROUP_NAME=${USER} \
-t saden \
.
```

## Installation 
Run `docker run --rm -v "$HOME/.local/bin:/home/user/.local/bin" saden install.sh` to install development environment into the `~/.local/bin` folder.

## Project initialization
Run `aden-create.sh <proj_name>` inside project folder. This will initialize environment for this project.

## More info
For more information visit the [DDEN](https://hub.docker.com/repository/docker/psugrg/dden/general) project page.
