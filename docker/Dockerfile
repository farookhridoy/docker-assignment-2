# Stage 1: Base PHP image with necessary extensions
FROM php:8.2-fpm-alpine AS base

# Install system and PHP dependencies
RUN apk add --no-cache \
    bash curl git zip unzip \
    libzip-dev libpng-dev libjpeg-turbo-dev \
    freetype-dev libwebp-dev libxpm-dev libxml2-dev oniguruma-dev \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
        --with-xpm \
    && docker-php-ext-install \
        pdo pdo_mysql mbstring zip bcmath pcntl gd

# Install Composer globally
COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Stage 2: Install Laravel vendor dependencies
FROM base AS vendor

WORKDIR /var/www

COPY . .

RUN composer install --no-interaction --prefer-dist

# Stage 3: Final runtime image
FROM base

WORKDIR /var/www

COPY --from=vendor /var/www /var/www

# Ensure necessary Laravel directories exist (fix build error)
RUN mkdir -p storage/framework/{cache,sessions,views} bootstrap/cache public/storage \
    && chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

# Copy entrypoint
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 9000
CMD ["php-fpm"]
