FROM php:8.0-fpm

# Install ImageMagick and MySQL driver
RUN apt-get update && apt-get install -y  \
    --no-install-recommends \
    libmagickwand-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install pdo_mysql \
    && apt-get install -y --no-install-recommends zlib1g-dev libzip-dev unzip \
    && docker-php-ext-install zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer