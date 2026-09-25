#!/bin/bash
set -e

mkdir -p /var/www/documents
mkdir -p /var/www/html/custom

chown -R www-data:www-data /var/www/documents
chown -R www-data:www-data /var/www/html/custom

echo "=== Apache MPM configuration ==="
apache2ctl -M 2>&1 | grep mpm || true

echo "=== Starting Apache ==="

exec apache2-foreground
