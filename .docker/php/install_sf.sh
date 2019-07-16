#!/usr/bin/env bash

# Symfony cli is not able to create a project inside a non empty directory
# So we will create project in a temporary directory
# and then copy all content inside the root project dir
symfony new --full --no-git --dir /tmp/symfony_app

cp -Rf /tmp/symfony_app/* /home/wwwroot/app
rm -Rf /tmp/symfony_app

chown -R dev:dev /home/wwwroot/app
chmod -R 777 /home/wwwroot/app/var/log/
chmod -R 777 /home/wwwroot/app/var/cache/
