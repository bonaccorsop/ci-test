#!/bin/bash

echo "deploy to production...";

#copy artifacts in new folder on server
#scp -r ./ vagrant@192.168.56.145:/var/www/prod

rsync -av --exclude '.git' vagrant@192.168.56.145:/var/www/prod

#switch directory
ssh root@nightly-api.crevity.com '
    chown -R www-data:www-data /var/www/prod-temp;
    mv /var/api /var/www/prod-old;
    mv /var/www/prod-temp /var/www/prod;
    rm -R /var/www/prod-old;'

#migrate db
ssh vagrant@192.168.56.145 'php /var/www/prod/artisan migrate'

echo "done";