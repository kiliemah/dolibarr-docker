#!/bin/bash
set -e

PORT="${PORT:-80}"

mkdir -p /var/www/documents
mkdir -p /var/www/html/custom

chown -R www-data:www-data /var/www/documents
chown -R www-data:www-data /var/www/html/custom

sed -i "s/^Listen .*/Listen ${PORT}/" /etc/apache2/ports.conf

cat > /etc/apache2/sites-available/000-default.conf <<EOF
<VirtualHost *:${PORT}>
    DocumentRoot /var/www/html

    <Directory /var/www/html>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

exec apache2-foreground
