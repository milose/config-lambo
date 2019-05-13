#!/bin/bash
GIT_DIR='.git'
composer install && \
    php artisan queue:restart && \
    php artisan cache:clear && \
    php artisan route:clear && \
    php artisan view:clear && \
    php artisan config:clear

# if run from the shell
read -rsp $'Press any key to start compiling assets. To abort press <CTRL+C>.\n' -n1 key

# skip compiling assets if `FASTER_MERGE=no git pull` is run
if [ "$FASTER_MERGE" != "no" ]; then
    yarn
    yarn run production
fi
