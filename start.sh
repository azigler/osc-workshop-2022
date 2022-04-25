#!/bin/bash

git submodule update --init
sudo docker-compose up -d --build
