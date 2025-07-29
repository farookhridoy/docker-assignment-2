#!/bin/sh

cd /var/www

# Copy .env if missing
if [ ! -f ".env" ]; then
    echo "Creating env file for env $APP_ENV"
    cp .env.example .env
else
    echo ".env file already exists"
fi

# Install composer dependencies if vendor is missing
if [ ! -f "vendor/autoload.php" ]; then
    echo "Running composer install..."
    composer install --no-progress --no-interaction
else
    echo "Composer dependencies already installed"
fi

# Run Laravel setup
echo "Running Laravel setup..."
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan cache:clear
php artisan key:generate
php artisan migrate --force || true

# Start PHP-FPM
exec php-fpm
