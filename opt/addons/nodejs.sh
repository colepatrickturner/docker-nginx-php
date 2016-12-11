#!/bin/sh

export PROFILE=/etc/profile.d/nvm.sh && touch $PROFILE
curl -sSL https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
echo "source ${NVM_DIR}/nvm.sh" > $HOME/.bashrc && \
    source $HOME/.bashrc

nvm install $NODE_VERSION
nvm alias default $NODE_VERSION
nvm use default
ln -s "$(which node)" /usr/bin/node
