#!/bin/bash
GIT_DIR='.git'
composer install && \
    php artisan cache:clear && \
    php artisan route:clear && \
    php artisan config:clear

read -rsp $'Press any key to start compiling assets. To abort press <CTRL+C>.\n' -n1 key

yarn
yarn run development
