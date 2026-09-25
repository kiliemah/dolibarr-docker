#!/bin/bash
set -e

mkdir -p /var/www/documents
mkdir -p /var/www/html/custom

chown -R www-data:www-data /var/www/documents
chown -R www-data:www-data /var/www/html/custom

sed -i 's|Listen 80|Listen 0.0.0.0:80|' /etc/apache2/ports.conf

exec apache2-foreground
