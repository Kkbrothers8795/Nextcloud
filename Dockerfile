FROM php:8.3-fpm-alpine3.18

COPY . .
EXPOSE 80 443 

CMD ["php", "-S", "0.0.0.0:80"]
