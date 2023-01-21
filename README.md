Clone the Docker/Laravel template.

cd ~Code

git clone https://github.com/davidrichied/docker-php80-mysql8-nginx-ssl-laravel9.git project

I'll refer to the project directory as the root directory now.

Save .env.local to .env in the root directory.

cd ~/Code/project

cp .env.local .env

Change the name of the database

If you are using the SSL version, install the keys. You can find the commands in the docker/ssl/generatessl.sh file.

This command creates the devcert.key file.

sudo openssl genrsa -out "devcert.key" 2048

When running the next command, be sure to enter localhost (or anything actually) for the "Common Name (eg, fully qualified host name)" option, or you'll get an error. That's the only required option.

sudo openssl req -new -key "devcert.key" -out "devcert.csr"

The next command creates the devcert.crt file.

sudo openssl x509 -req -days 365 -in "devcert.csr" -signkey "devcert.key" -out "devcert.crt"

Start up the docker container in the root directory.

docker compose up -d --build

Set up Laravel.

Save the laravel/.env.example to .env

cd ~/Code/project/laravel

cp .env.example .env

Update the database variables.

DB_DATABASE=dpmnsl

DB_USERNAME=dev

DB_PASSWORD=secret


Go into the phpapp container and install Laravel composer packages.

cd ~/Code/project

docker compose exec phpapp bash

composer install

php artisan key:generate



