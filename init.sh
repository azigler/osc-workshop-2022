#!/bin/bash

git submodule update --init
sudo certbot certonly --non-interactive --standalone --agree-tos -m me@andrewzigler.com -d healthchecks.andrewzigler.com
sudo certbot certonly --non-interactive --standalone --agree-tos -m me@andrewzigler.com -d deckofcards.andrewzigler.com

export OSC_PATH=$PWD && sudo ln -s /etc/letsencrypt/live/healthchecks.andrewzigler.com/fullchain.pem $OSC_PATH/gitlab/nginx/certs/healthchecks.andrewzigler.com.crt
export OSC_PATH=$PWD && sudo ln -s /etc/letsencrypt/live/healthchecks.andrewzigler.com/privkey.pem $OSC_PATH/gitlab/nginx/certs/healthchecks.andrewzigler.com.key

export OSC_PATH=$PWD && sudo ln -s /etc/letsencrypt/live/cards.andrewzigler.com/fullchain.pem $OSC_PATH/gitlab/nginx/certs/deckofcards.andrewzigler.com.crt
export OSC_PATH=$PWD && sudo ln -s /etc/letsencrypt/live/cards.andrewzigler.com/privkey.pem $OSC_PATH/gitlab/nginx/certs/deckofcards.andrewzigler.com.key