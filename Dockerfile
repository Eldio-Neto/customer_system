FROM php:8.1-apache

# Install additional OS packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends git unzip

# Install Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Set the working directory
WORKDIR /var/www/html