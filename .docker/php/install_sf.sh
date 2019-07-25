#!/usr/bin/env bash

# Symfony cli is not able to create a project inside a non empty directory
# So we will create project in a temporary directory
# and then copy all content inside the root project dir
symfony new --full --no-git --dir /tmp/symfony_app

cp -Rf /tmp/symfony_app/* /home/wwwroot/app
rm -Rf /tmp/symfony_app

cd /home/wwwroot/app

chown -R dev:dev /home/wwwroot/app
chmod -R 777 var/log/
chmod -R 777 var/cache/

echo "Installing symfony/phpunit-bridge"
composer require --dev symfony/phpunit-bridge phpunit

echo "Running phpunit for the first time so that the symfony/phpunit-bridge downloads the right version of phpunit..."
bin/phpunit
