#!/bin/bash

# update packages
sudo apt-get update -y
sudo apt-get upgrade -y

# Install nginx
sudo apt-get install nginx -y

# Install ruby
sudo apt-get install ruby -y
sudo apt-get install gem -y

# Install rake
sudo apt-get install rake -y

# get key for MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# Create a list for MongoDB
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update -y

# Install MongoDB 3.2.18
sudo apt-get install -y mongodb-org=3.2.18 mongodb-org-server=3.2.18 mongodb-org-shell=3.2.18 mongodb-org-mongos=3.2.18 mongodb-org-tools=3.2.18

# config MongoDB
sudo rm /etc/mongod.conf
sudo ln -s /home/vagrant/db/environment/db/mongod.conf /etc/mongod.conf

# restart MongoDB
sudo systemctl restart mongod
sudo systemctl enable mongod
