# Use the official PHP image with Apache
FROM php:8.2-apache

# Enable Apache mod_rewrite if you need it (optional)
RUN a2enmod rewrite

# Set working directory inside the container
WORKDIR /var/www/html

# Install PHP extensions if needed (optional)
# RUN docker-php-ext-install mysqli pdo pdo_mysql

# This line is left empty so we can mount code instead of copying
# COPY . /var/www/html

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN apt-get update
RUN install-php-extensions gettext gd intl zip pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# RUN composer install

RUN echo "max_input_vars = 8000\nupload_max_filesize = 50M\npost_max_size = 51M;" > /usr/local/etc/php/conf.d/gibbon.ini

# Expose port 80 (Apache default)
EXPOSE 80
