#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"

MYSQL_ROOT_PASSWORD="root"
sudo debconf-set-selections <<< "mysql-server-5.6 mysql-server/root_password password \"'$MYSQL_ROOT_PASSWORD'\""
sudo debconf-set-selections <<< "mysql-server-5.6 mysql-server/root_password_again password \"'$MYSQL_ROOT_PASSWORD'\""

sudo apt-get install -y python-software-properties

sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/mysql

sudo apt-get update

sudo apt-get install -y curl git build-essential

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get install -y php7.0-fpm php7.0-cli php7.0-xml php7.0-mbstring nginx mysql-server-5.6

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

sudo rm -f /etc/nginx/sites-available/default
sudo cp /provision/nginx/sites /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/nginx /etc/nginx/sites-enabled/
sudo rm -rf /etc/nginx/sites-enabled/default
sudo rm -rf /etc/nginx/sites-available/default

sudo service nginx restart
sudo service php7-fpm restart
