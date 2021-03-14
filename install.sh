#!/bin/bash

echo "Installing dependencies..."
sudo apt-get -y update
sudo apt-get install -y nginx
sudo apt-get install -y maven
sudo apt-get install -y default-jdk
sudo apt-get install -y wget

echo "Setting up NGINX..." 
sudo wget -o https://github.com/alnwoks/geostore/tree/master/nginx/default.conf nginx.conf
sudo mv default.conf /etc/nginx/nginx.conf