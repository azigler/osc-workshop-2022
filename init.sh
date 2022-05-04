#!/bin/bash

[ -z "$DEMO_HOSTNAME" ] && echo "Please export a demo hostname to your bash environment (e.g., export DEMO_HOSTNAME=example.com)" && exit 1

git submodule update --init
sudo certbot certonly --non-interactive --standalone --agree-tos -m info@$1 -d hc1.$1
sudo certbot certonly --non-interactive --standalone --agree-tos -m info@$1 -d doc1.$1

sudo cp /etc/letsencrypt/live/hc1.$1/fullchain.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/hc1.$1.crt
sudo cp /etc/letsencrypt/live/hc1.$1/privkey.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/hc1.$1.key

sudo cp /etc/letsencrypt/live/doc1.$1/fullchain.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/doc1.$1.crt
sudo cp /etc/letsencrypt/live/doc1.$1/privkey.pem /home/ubuntu/osc-workshop-2022/gitlab/nginx/certs/doc1.$1.key
