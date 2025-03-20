FROM php:8.3-fpm

# Instalar dependências comuns
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    nano

# Instalar extensões PHP comuns
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql zip opcache

# Habilitar extensões
RUN docker-php-ext-enable opcache

# Instalar o Composer (gerenciador de dependências do PHP)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Definir diretório de trabalho
WORKDIR /var/www/html

# Limpar o cache do APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*