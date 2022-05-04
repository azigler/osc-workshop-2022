#!/bin/bash

git submodule update --init
if [ `uname` != "Darwin" ]
then
    sudo chown -R 2000:2000 ./mattermost/app/
fi

