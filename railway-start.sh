#!/bin/bash
set -e

mkdir -p /var/www/documents
mkdir -p /var/www/html/custom

chown -R www-data:www-data /var/www/documents
chown -R www-data:www-data /var/www/html/custom

exec apache2-foreground
