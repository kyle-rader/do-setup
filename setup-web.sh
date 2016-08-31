#!/bin/bash

echo "Setting up Web Services"

apt-get update
apt-get upgrade

apt-get -y install git
apt-get install nginx

git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt

echo "Ready to finish LetsEncrypt setup: https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04"
