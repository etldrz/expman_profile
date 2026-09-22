#!/bin/bash

#echo "${USER}:${GROUP}" >> /local/here.txt
#ls /users > /local/here.txt
#echo $SHELL > /local/here.text

curl https://mise.run | sh
#echo "eval \"\$($HOME/.local/bin/mise activate bash)\"" >> "$HOME/.bashrc"
eval "$($HOME/.local/bin/mise activate bash)"
git clone https://github.com/etldrz/caring.git /local/expman
cd /local/expman
sudo chown "$USER" .
mise install

export SHELL=/bin/bash
mix local.hex --if-missing --force
mix deps.get
MIX_ENV=prod mix release
export RELEASE_DISTRIBUTION=$(hostname | sed 's/\..*//')
export RELEASE_NODE=$(curl ifconfig.io)
echo "$RELEASE_DISTRIBUTION\n$RELEASE_NODE" > /local/here.txt
_build/prod/rel/experiment_manager/bin/experiment_manager start
#iex --name "$node_name@$node_addr" --cookie salsa -S mix 
