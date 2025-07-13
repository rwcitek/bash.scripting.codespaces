#!/bin/bash

# Is the container running?
docker container list | grep -q jupyter && { 
  echo Jupyter already running
  exit 0
}

# Is the container stopped?
docker container list -a | grep -q jupyter && {
  echo Jupyter stopped; removing and restarting
  docker container rm jupyter
}

# If there's no container, run jupyter in Docker container instance
docker container run \
  --rm \
  --detach \
  --volume "${PWD}":/data/ \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --workdir /data/ \
  --publish 127.0.0.1:8888:8888 \
  --name jupyter \
  rwcitek/jupyter.light \
    jupyter lab --allow-root --ip=0.0.0.0 --NotebookApp.token=''

sleep 1

# Configure the Docker instance with some extra stuff
{ cat <<'eof'
# Install some python libraries
pip3 install --upgrade --break-system-packages \
     matplotlib \
     scikit-learn \
     seaborn \
     && pip cache purge \

# Install some system tools
apt-get update

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    jq \
    less \
    lsb-release \
    tree \
    ;

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |
gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" |
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

apt-get install -y docker-ce-cli
eof
} | docker container exec -i jupyter /bin/bash


# Keep alive -- seems to prevent timeouts in CodeSpaces
while : ; do
  date
  sleep 1
  for i in {1..10} ; do
    echo -n . 
    sleep 1
  done
  echo
done
