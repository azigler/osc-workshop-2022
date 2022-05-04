#!/bin/bash

if [ `uname` != "Darwin" ]
then
    sudo chown -R 2000:2000 ./mattermost/app/
fi

