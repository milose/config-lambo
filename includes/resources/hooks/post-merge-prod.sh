#!/bin/bash
GIT_DIR='.git'
composer install && \
    php artisan cache:clear && \
    php artisan config:cache && \
    php artisan route:cache

sudo pm2 restart -1

read -rsp $'Press any key to start compiling assets. To abort press <CTRL+C>.\n' -n1 key

yarn
yarn run production
