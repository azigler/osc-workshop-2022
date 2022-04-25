#!/bin/bash

git submodule update --init
sudo certbot certonly --non-interactive --standalone --agree-tos -m me@andrewzigler.com -d hc1.andrewzigler.com
sudo certbot certonly --non-interactive --standalone --agree-tos -m me@andrewzigler.com -d doc1.andrewzigler.com

sudo cp /etc/letsencrypt/live/hc1.andrewzigler.com/fullchain.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/hc1.andrewzigler.com.crt
sudo cp /etc/letsencrypt/live/hc1.andrewzigler.com/privkey.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/hc1.andrewzigler.com.key

sudo cp /etc/letsencrypt/live/doc1.andrewzigler.com/fullchain.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/doc1.andrewzigler.com.crt
sudo cp /etc/letsencrypt/live/doc1.andrewzigler.com/privkey.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/doc1.andrewzigler.com.key
