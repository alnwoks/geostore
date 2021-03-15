#!/bin/bash

echo "Installing dependencies..."
sudo apt-get -y update
sudo apt-get install -y nginx
sudo apt-get install -y maven
sudo apt-get install -y default-jdk
sudo apt-get install -y wget

echo "Setting up NGINX..." 
sudo wget https://github.com/alnwoks/geostore/tree/master/nginx/default.conf
sudo mv default.conf /etc/nginx/nginx.conf
sudo nginx -s reload

echo "Setting up AWS Code deploy agent..."
sudo apt-get install -y ruby
sudo wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
sudo mv install /home/ubuntu/install
sudo chmod +x /home/ubuntu/install
sudo /home/ubuntu/install auto > /tmp/logfile
sudo systemctl start codedeploy-agent   

echo "User-Data"
sudo apt-get update -y
sudo apt-get -y install ruby
sudo apt-get -y install wget
cd /home/ubuntu
sudo wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto > logfile
sudo apt-get install -y python3-pip
sudo pip3 install awscli
sudo apt-get update -y