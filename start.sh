#!/bin/bash

[ -z "$DEMO_HOSTNAME" ] && echo "Please export a demo hostname to your bash environment (e.g., export DEMO_HOSTNAME=example.com)" && exit 1

git submodule update --init
sudo docker-compose up -d --build
