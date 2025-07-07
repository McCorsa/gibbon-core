# FROM php:8.2-cli
FROM mcr.microsoft.com/devcontainers/php:1-8.2-bullseye

# Install PHP extensions
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN apt-get update
RUN install-php-extensions gettext gd intl zip pdo_mysql
