FROM php:8.2-apache

RUN apache2ctl -M

EXPOSE 80

CMD ["apache2-foreground"]
