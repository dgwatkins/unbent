FROM wordpress:6.4.1-php8.0-apache

RUN apt-get update && apt-get -y install wget unzip
RUN wget -O /tmp/plugin.zip http://github.com/WordPress/sqlite-database-integration/archive/refs/heads/main.zip
RUN unzip -d /var/www/html/wp-content/plugins /tmp/plugin.zip
RUN rm /tmp/plugin.zip
RUN mv /var/www/html/wp-content/plugins/sqlite-database-integration-main /var/www/html/wp-content/plugins/sqlite-database-integration
RUN cp /var/www/html/wp-content/plugins/sqlite-database-integration/db.copy /var/www/html/wp-content/db.php

COPY wp-config.php /var/www/html/wp-config.php
RUN chown -R www-data:www-data /var/www

VOLUME ["/var/www/db"]
