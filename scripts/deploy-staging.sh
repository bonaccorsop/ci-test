#!/bin/bash

echo "deploy to staging...";

#copy artifacts in new folder on server
scp -r ./ vagrant@192.168.56.145:/var/www/stage

#switch directory
ssh root@nightly-api.crevity.com '
    chown -R www-data:www-data /var/www/stage-temp;
    mv /var/api /var/www/stage-old;
    mv /var/www/stage-temp /var/www/stage;
    rm -R /var/www/stage-old;'

#migrate db
ssh vagrant@192.168.56.145 'php /var/www/stage/artisan migrate'

echo "done";