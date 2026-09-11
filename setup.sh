#!/bin/bash

echo "This is going to make a file" >> "$HOME/test.tx"

curl https://mise.run | sh
echo "eval \"\$($HOME/.local/bin/mise activate bash)\"" >> "$HOME/.bashrc"
#git clone elixir repo
#cd into
#mise install
