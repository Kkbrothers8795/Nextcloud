FROM php:8.3-fpm-alpine3.18
WORKDIR /var/www/html
RUN apt-get update -y && apt-get install -y sendmail libpng-dev

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev
        
RUN docker-php-ext-install gd zip pdo_mysql gmp ffmpeg intl ftp memcached
COPY . /var/www/html/
RUN chmod +x *
EXPOSE 80 443 
CMD ["php", "-S", "0.0.0.0:80"]
