FROM php:8.4-fpm-bookworm

# Definir diretório de trabalho
WORKDIR /var/www/html

# Instalar utilitários essenciais
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    nano


RUN apt-get update && apt-get install -y libmariadb-dev
RUN docker-php-ext-install pdo_mysql

RUN apt-get update && apt-get install -y libmariadb-dev
RUN docker-php-ext-install mysqli

RUN apt-get update && apt-get install -y libsqlite3-dev
RUN docker-php-ext-install pdo_sqlite

RUN docker-php-ext-install bcmath

RUN apt-get update && apt-get install -y libcurl4-openssl-dev
RUN docker-php-ext-install curl

RUN apt-get update && apt-get install -y libzip-dev
RUN docker-php-ext-install zip

RUN apt-get update && apt-get install -y libicu-dev
RUN docker-php-ext-install -j$(nproc) intl

RUN apt-get update && apt-get install -y libonig-dev
RUN docker-php-ext-install mbstring

RUN docker-php-ext-install gettext

RUN docker-php-ext-install calendar

RUN apt-get update && apt-get install -y libexif-dev
RUN docker-php-ext-install exif

RUN apt-get update && apt-get install -y libxml2-dev
RUN docker-php-ext-install soap

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libwebp-dev
RUN docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install ctype

RUN apt-get update && apt-get install -y libxml2-dev
RUN docker-php-ext-install xml

RUN apt-get update && apt-get install -y libgmp-dev
RUN docker-php-ext-install gmp

RUN docker-php-ext-install iconv

RUN docker-php-ext-install opcache

RUN apt-get update && apt-get install -y libzip-dev \
    && pecl channel-update pecl.php.net \
    && pecl install redis
RUN docker-php-ext-enable redis

RUN docker-php-ext-install pcntl

RUN docker-php-ext-install posix

RUN apt-get update && apt-get install -y libldap2-dev
RUN docker-php-ext-install ldap

RUN apt-get update && apt-get install -y libsodium-dev
RUN docker-php-ext-install sodium

RUN apt-get update && apt-get install -y libpq-dev
RUN docker-php-ext-install pdo_pgsql

RUN apt-get update && apt-get install -y libc-client-dev libkrb5-dev \
    && pecl install imap
RUN docker-php-ext-enable imap
