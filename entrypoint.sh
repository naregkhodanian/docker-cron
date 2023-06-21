#!/bin/sh

env >> /etc/environment

# Run Laravel queue worker
php artisan queue:work --daemon &

# Run Laravel scheduler
while [ true ]
do
    php artisan schedule:run --verbose --no-interaction
    sleep 60
done

# execute CMD
echo "$@"
exec "$@"
