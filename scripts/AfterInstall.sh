#!/bin/bash

# load nvm
if ! command -v nvm > /dev/null
then
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi

NODE_VERSION=$(cat /home/ubuntu/app/.nvmrc)
nvm use $NODE_VERSION

# load npm
if ! command -v npm > /dev/null
then
    export PATH="$NVM_DIR/versions/node/$(nvm version)/bin:$PATH"
fi

cd /home/ubuntu/app
yarn install --immutable --check-cache
pm2 startOrReload ecosystem.config.js