FROM wordpress:6.4.1-php8.0-apache

RUN apt-get update && apt-get -y install unzip
RUN curl -o /tmp/wpplugin.zip https://github.com/WordPress/sqlite-database-integration/archive/refs/heads/main.zip
RUN unzip /tmp/wpplugin.zip -d /usr/src/wordpress/wp-content/plugins/
RUN rm /tmp/wpplugin.zip
RUN cd /usr/src/wordpress/wp-content/plugins && mv sqlite-integration-main sqlite-integration
RUN cp /usr/src/wordpress/wp-content/plugins/sqlite-integration/db.php /usr/src/wordpress/wp-content

COPY wp-config.php /var/www/wp-config.php
RUN chown www-data:www-data /var/www/wp-config.php

VOLUME ["/var/www/db"]
