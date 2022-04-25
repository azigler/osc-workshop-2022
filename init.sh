#!/bin/bash

git submodule update --init
sudo certbot certonly --non-interactive --standalone --agree-tos -m me@andrewzigler.com -d healthchecks.andrewzigler.com
sudo certbot certonly --non-interactive --standalone --agree-tos -m me@andrewzigler.com -d deckofcards.andrewzigler.com

sudo ln -s /etc/letsencrypt/live/healthchecks.andrewzigler.com/fullchain.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/healthchecks.andrewzigler.com.crt
sudo ln -s /etc/letsencrypt/live/healthchecks.andrewzigler.com/privkey.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/healthchecks.andrewzigler.com.key

sudo ln -s /etc/letsencrypt/live/cards.andrewzigler.com/fullchain.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/deckofcards.andrewzigler.com.crt
sudo ln -s /etc/letsencrypt/live/cards.andrewzigler.com/privkey.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/deckofcards.andrewzigler.com.key