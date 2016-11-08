#!/bin/bash

# update composer
composer update

# clear laravel cache
php artisan config:clear
php artisan cache:clear
php artisan view:clear

# windows
sudo npm install --no-bin-links

