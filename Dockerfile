FROM php:8.3-fpm-alpine3.18
WORKDIR /var/www/html
RUN docker-php-ext-install gd zip
COPY . /var/www/html/
RUN chmod +x *
EXPOSE 80 443 
CMD ["php", "-S", "0.0.0.0:80"]
