#!/bin/bash

[ -z "$HOSTNAME" ] && echo "Please export a hostname to your bash environment (e.g., export HOSTNAME=example.com)" && exit 1

git submodule update --init
sudo docker-compose up -d --build
