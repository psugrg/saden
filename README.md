# Sandbox Docker-based Development Environment 
Sa-d-en is a Sandbox Docker-based development Environment created to test and play with implementation of the [Docker based Development Environment](https://hub.docker.com/repository/docker/psugrg/dden/general).

## Compilation
Run `Docker build --tag=saden .`

## Installation 
Run `docker run --rm -v "$HOME/.local/bin:/home/user/.local/bin" -u "$(id -u):$(id -g)" saden install.sh` inside project folder. This will install environment for this project.

## More info
For more information visit the [DDEN](https://hub.docker.com/repository/docker/psugrg/dden/general) project page.