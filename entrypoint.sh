#!/bin/sh

env >> /etc/environment

# Run Laravel queue worker
php artisan queue:work --daemon &

# execute CMD
echo "$@"
exec "$@"
