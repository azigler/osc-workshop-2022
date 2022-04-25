#!/bin/bash

git submodule update --init
sudo certbot certonly --non-interactive --standalone --agree-tos -m me@andrewzigler.com -d healthchecks.andrewzigler.com
sudo certbot certonly --non-interactive --standalone --agree-tos -m me@andrewzigler.com -d deckofcards.andrewzigler.com

sudo cp /etc/letsencrypt/live/healthchecks.andrewzigler.com/fullchain.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/healthchecks.andrewzigler.com.crt
sudo cp /etc/letsencrypt/live/healthchecks.andrewzigler.com/privkey.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/healthchecks.andrewzigler.com.key

sudo cp /etc/letsencrypt/live/deckofcards.andrewzigler.com/fullchain.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/deckofcards.andrewzigler.com.crt
sudo cp /etc/letsencrypt/live/deckofcards.andrewzigler.com/privkey.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/deckofcards.andrewzigler.com.key
