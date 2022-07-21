FROM php:7-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev mysql-client \
    && docker-php-ext-install mcrypt pdo_mysql

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ADD ./php.conf /usr/local/etc/php-fpm.conf
COPY ./php.ini /usr/local/etc/php/

ADD ./src /var/www/blog
RUN chown www-data:www-data -R /var/www/blog

RUN apt-get install net-tools -y

WORKDIR /var/www/blog

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install
