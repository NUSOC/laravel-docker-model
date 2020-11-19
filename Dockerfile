FROM php:7.4-apache
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install pdo_mysql mbstring
COPY --chown=33:33 ./project/ /var/www/html/
RUN sed -i '/DFOREGROUND/i composer up && php artisan migrate' /usr/local/bin/apache2-foreground \
&& sed -i '/artisan/i export COMPOSER_HOME="~/.config/composer"' /usr/local/bin/apache2-foreground
