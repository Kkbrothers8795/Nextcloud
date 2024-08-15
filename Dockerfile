FROM php:8.3-fpm-alpine3.18
WORKDIR /var/www/html
RUN apt update && apt install -y zlib1g-dev libpng-dev && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install gd zip
COPY . /var/www/html/
RUN chmod +x *
EXPOSE 80 443 
CMD ["php", "-S", "0.0.0.0:80"]
