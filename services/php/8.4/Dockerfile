FROM php:8.4-fpm-bookworm

# Definir diretório de trabalho
WORKDIR /var/www

# Apagar o diretório /var/www/html da imagem para evitar conflito com o volume
# montado na pasta /var/www, onde a aplicação será mapeada
RUN rm -rf /var/www/html

# Configure PHP
RUN ln -s "/usr/local/etc/php/php.ini-production" "/usr/local/etc/php/php.ini"

# o nome zzz-php.ini (com o prefixo zzz) garante que ele seja o último a ser carregado, sobrescrevendo qualquer configuração feita em outros arquivos .ini.
COPY php.ini /usr/local/etc/php/conf.d/zzz-php.ini

# Instalar utilitários essenciais
RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing \
    git \
    curl \
    zip \
    unzip \
    nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Instalar o composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update \
    && apt-get install -y --no-install-recommends --fix-missing libmagickwand-dev \
    && rm -rf /var/lib/apt/lists/* \
    && cd /usr/local/src \
    && git clone https://github.com/Imagick/imagick.git \
    && cd imagick \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf imagick \
    && docker-php-ext-enable imagick \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libmariadb-dev mariadb-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install pdo_mysql

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libmariadb-dev mariadb-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install mysqli

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libsqlite3-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install pdo_sqlite

RUN docker-php-ext-install bcmath

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libcurl4-openssl-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install curl

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libzip-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install zip

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libicu-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install -j$(nproc) intl

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libonig-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install mbstring

RUN docker-php-ext-install gettext

RUN docker-php-ext-install calendar

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libexif-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install exif

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libxml2-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install soap

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libpng-dev libjpeg-dev libwebp-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install ctype

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libxml2-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install xml

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libgmp-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install gmp

RUN docker-php-ext-install iconv

RUN docker-php-ext-install opcache

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libzip-dev \
    && pecl channel-update pecl.php.net \
    && pecl install redis \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-enable redis

RUN docker-php-ext-install pcntl

RUN docker-php-ext-install posix

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libldap2-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install ldap

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libsodium-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install sodium

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libpq-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install pdo_pgsql

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing libc-client-dev libkrb5-dev \
    && pecl install imap \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-enable imap

# Copiar o script de entrada para dentro do container e garantir que ele tenha permissão de execução
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# DAQUI EM DIANTE FOI PEGO NA IMAGEM ORIGINAL
# Sobrescreve o ENTRYPOINT para rodar o script original primeiro, e depois o meu script
ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/docker-php-entrypoint && /entrypoint.sh"]

# Incluído no entrypoint.sh
# CMD ["php-fpm"]