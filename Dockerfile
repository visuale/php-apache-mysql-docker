FROM php:7.3-apache 

# Install mysqli, MySQL PDO (for Drupal)
RUN docker-php-ext-install mysqli pdo_mysql opcache


# Install GD and other dependencies -- GD in particular is required For Drupal & Wordpress
RUN apt-get update -y && \
     apt-get install -y \
     libwebp-dev \
     libjpeg62-turbo-dev \
     libpng-dev \
     libxpm-dev \
     libfreetype6-dev

RUN docker-php-ext-configure gd \
    --with-gd \ 
    --with-webp-dir \ 
    --with-jpeg-dir \
    --with-png-dir \ 
    --with-zlib-dir \ 
    --with-xpm-dir \
    --with-freetype-dir \ 
    --enable-gd-native-ttf

RUN docker-php-ext-install gd

# Add for Xdebug    
RUN pecl install -f xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini;


# Allows mod_rewrite for images in Apache environment
RUN if command -v a2enmod >/dev/null 2>&1; then \
        a2enmod rewrite headers \
    ;fi