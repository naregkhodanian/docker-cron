#!/bin/sh

env >> /etc/environment

# Set the working directory to the root directory of the Laravel app
cd /app

# Run Laravel queue worker with database driver
php artisan --no-interaction queue:work database &

# Run Laravel scheduler
while [ true ]
do
    php artisan --no-interaction schedule:run
    sleep 60
done

# execute CMD
echo "$@"
exec "$@"
