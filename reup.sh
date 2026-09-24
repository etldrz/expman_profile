#!/bin/sh

cd /local
expman/_build/prod/rel/experiment_manager/bin/experiment_manager stop

rm -rf expman
git clone https://github.com/etldrz/caring expman
cd /local/expman
sudo chown "$USER" .
mise install

mix local.hex --if-missing --force
mix deps.get
MIX_ENV=prod mix release
export RELEASE_DISTRIBUTION="name"
export RELEASE_NODE=$(hostname | sed 's/\..*//')@$(curl ifconfig.io)
export RELEASE_COOKIE="salsa"
echo "node: $RELEASE_NODE, cookie: $RELEASE_COOKIE" > /local/here.txt
_build/prod/rel/experiment_manager/bin/experiment_manager daemon
