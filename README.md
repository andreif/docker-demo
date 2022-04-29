# Demo of using Docker for Python projects

When using Podman instead of Docker:
```sh
brew install podman
pip install podman-compose

alias docker=podman
# or  ln -s /opt/homebrew/bin/podman /opt/homebrew/bin/docker
alias docker-compose=podman-compose
# or  ln -s /Users/andrei/.pyenv/shims/podman-compose /Users/andrei/.pyenv/shims/docker-compose
# or  cat /usr/local/bin/docker-compose
#!/bin/sh
/Users/andrei/.pyenv/versions/podman/bin/podman-compose $*

sudo /opt/homebrew/Cellar/podman/4.0.3/bin/podman-mac-helper install
export DOCKER_HOST='unix:///Users/andrei/.local/share/containers/podman/machine/podman-machine-default/podman.sock'

docker login docker.io

make podman  # mounts user home to virtual machine
make build

# If containers require root permissions:
# podman machine set --rootful
```

```sh
make setup  # create venv and install requirements
make run  # run script in container

make sh  # linux shell
make py  # python shell

make clean  # remove venv and containers
```
### Make sure to use Compose V1

![DockerDesktop](screenshots/DockerDesktop.png)

### Configure Python interpreter in PyCharm

![Docker](screenshots/Docker.png)

![DockerCompose](screenshots/DockerCompose.png)

![PyCharm](screenshots/PyCharm.png)
