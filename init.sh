#!/bin/bash

if [ `arch` != "arm64" ]
then
    sudo chown -R 2000:2000 ./mattermost/app/
fi

