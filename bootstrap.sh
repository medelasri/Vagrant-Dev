#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"

MYSQL_ROOT_PASSWORD="root"
sudo debconf-set-selections <<< "mysql-server-5.6 mysql-server/root_password password \"'$MYSQL_ROOT_PASSWORD'\""
sudo debconf-set-selections <<< "mysql-server-5.6 mysql-server/root_password_again password \"'$MYSQL_ROOT_PASSWORD'\""

sudo apt-get update
sudo apt-get install -y python-software-properties

sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/mysql

sudo apt-get update
sudo apt-get install -y vim curl git build-essential

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install -y nodejs php7.0-fpm php7.0-cli php7.0-xml php7.0-mbstring php7.0-zip nginx mysql-server-5.6

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

sudo rm -f /etc/nginx/sites-available/default
sudo cp provision/nginx/sites/default.conf /etc/nginx/sites-available/
sudo rm -rf provision/nginx/sites/default
sudo ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/
sudo rm -rf /etc/nginx/sites-enabled/default
sudo rm -rf /etc/nginx/sites-available/default

sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;FLUSH PRIVILEGES"

sudo service nginx restart
sudo service php7-fpm restart
