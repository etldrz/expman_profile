#!/bin/bash

cd /local
chown +x "${USER}:${GROUP}"
echo "${USER}:${GROUP}" >> /local/here.txt

curl https://mise.run | sh
echo "eval \"\$($HOME/.local/bin/mise activate bash)\"" >> "$HOME/.bashrc"
eval "$(HOME/.local/bin/mise activate bash)"
git clone https://github.com/etldrz/caring.git /local/expman
cd /local/expman
sudo mise install
