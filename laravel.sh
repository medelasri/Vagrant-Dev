#!/bin/bash

#update composer
composer update

#clear laravel cache
php artisan config:clear
php artisan cache:clear
php artisan view:clear

#migrate database
php artisan migrate

#npm install
sudo npm install --no-bin-links

