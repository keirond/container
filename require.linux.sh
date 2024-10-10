#! /bin/bash

sudo apt install make -y
sudo apt install podman pipx -y
pipx install podman-compose

# Check whether ~/.local/bin in $PATH