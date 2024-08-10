#!/bin/bash
apt-get update

if [ -e ~/.nvm/nvm.sh ]
then
    . ~/.nvm/nvm.sh
fi

# install nvm
if ! command -v nvm > /dev/null
then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
    . ~/.nvm/nvm.sh
fi

# install node
NODE_VERSION=$(cat /home/ubuntu/app/.nvmrc)
nvm install $NODE_VERSION
nvm use $NODE_VERSION

# load npm
if ! command -v npm > /dev/null
then
    export PATH="$NVM_DIR/versions/node/$(nvm version)/bin:$PATH"
fi

# install yarn
if ! command -v yarn > /dev/null
then
    npm install -g yarn
fi

# install pm2
if ! command -v pm2 > /dev/null
then
    npm install -g pm2
fi