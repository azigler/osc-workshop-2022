#!/bin/bash

git submodule update --remote
sudo docker-compose up -d --build
