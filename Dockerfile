FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libonig-dev \
    unzip \
    git \
    curl \
    default-mysql-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        mysqli \
        pdo \
        pdo_mysql \
        intl \
        zip \
        gd \
        mbstring \
        xml \
        opcache \
    && rm -rf /var/lib/apt/lists/*

# Disable any MPM that may be enabled
RUN a2dismod mpm_event mpm_worker mpm_prefork 2>/dev/null || true

# Enable exactly one MPM
RUN a2enmod mpm_prefork rewrite

WORKDIR /var/www/html

RUN curl -fsSL \
    https://www.dolibarr.org/files/stable/standard/dolibarr-24.0.1.tgz \
    -o /tmp/dolibarr.tgz \
    && tar -xzf /tmp/dolibarr.tgz \
       --strip-components=1 \
       -C /var/www/html \
    && rm /tmp/dolibarr.tgz

RUN mkdir -p /var/www/documents \
    /var/www/html/custom \
    && chown -R www-data:www-data \
       /var/www/html \
       /var/www/documents

COPY railway-start.sh /usr/local/bin/railway-start.sh

RUN chmod +x /usr/local/bin/railway-start.sh

EXPOSE 80

CMD ["/usr/local/bin/railway-start.sh"]WORKDIR /var/www/html

RUN curl -fsSL \
    https://www.dolibarr.org/files/stable/standard/dolibarr-24.0.1.tgz \
    -o /tmp/dolibarr.tgz \
    && tar -xzf /tmp/dolibarr.tgz \
       --strip-components=1 \
       -C /var/www/html \
    && rm /tmp/dolibarr.tgz

RUN mkdir -p /var/www/documents \
    /var/www/html/custom \
    && chown -R www-data:www-data \
       /var/www/html \
       /var/www/documents

COPY railway-start.sh /usr/local/bin/railway-start.sh

RUN chmod +x /usr/local/bin/railway-start.sh

EXPOSE 80

CMD ["/usr/local/bin/railway-start.sh"]
