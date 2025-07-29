# Stage 1: Base PHP image with necessary extensions
FROM php:8.2-fpm-alpine as base

RUN apk add --no-cache \
    bash \
    curl \
    git \
    zip \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libwebp-dev \
    libxpm-dev \
    libxml2-dev \
    oniguruma-dev \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
        --with-xpm \
    && docker-php-ext-install \
        pdo pdo_mysql mbstring zip bcmath pcntl gd

COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Stage 2: Pre-bake dependencies for potential use (optional if mounting code)
FROM base as vendor

WORKDIR /var/www
COPY . .
RUN composer install --no-interaction --prefer-dist

# Stage 3: Final runtime
FROM base

WORKDIR /var/www

COPY --from=vendor /var/www /var/www

# Permissions
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 9000
