FROM php:8.1.0-fpm
RUN apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
                                   --with-png-dir=/usr/include/ --enable-gd-native-ttf \
    && docker-php-ext-install -j$(nproc) gd
WORKDIR /var/www/html
COPY . /var/www/html/
RUN chmod +x *
EXPOSE 80 443 
CMD ["php", "-S", "0.0.0.0:80"]
