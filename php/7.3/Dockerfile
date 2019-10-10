FROM php:7.3

MAINTAINER Sergey Gonimar <sergey.gonimar@gmail.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libbz2-dev \
    libmemcached-dev \
    curl \
    git \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libldap2-dev \
    libmemcachedutil2 \
    libpng-dev \
    libpq-dev \
    libxml2-dev \
    libzip-dev \
    libmagickwand-dev \
    --no-install-recommends

RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    bz2 \
    calendar \
    dom gd gettext iconv intl json mbstring mysqli opcache pdo_mysql pdo_pgsql pgsql soap zip

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN apt-get purge -y --auto-remove && rm -rf /var/lib/apt/lists/*

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require "squizlabs/php_codesniffer=*"
RUN composer global require "phpmd/phpmd=@stable"
RUN composer global require "sebastian/phpcpd"

RUN echo "export PATH=${PATH}:$(composer config home --global)/vendor/bin" >> ${HOME}/.profile

RUN . ${HOME}/.profile
