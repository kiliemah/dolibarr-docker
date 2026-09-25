FROM dolibarr/dolibarr:latest

COPY railway-entrypoint.sh /usr/local/bin/railway-entrypoint.sh

RUN chmod +x /usr/local/bin/railway-entrypoint.sh

CMD ["/usr/local/bin/railway-entrypoint.sh", "apache2-foreground"]
