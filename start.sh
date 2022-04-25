#!/bin/bash

git submodule update --init
sudo OSC_PATH=$PWD docker-compose up -d
