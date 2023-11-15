FROM wordpress:6.4.1-php8.0-apache

RUN apt-get update && apt-get -y install wget unzip
RUN cd /usr/src/wordpress/wp-content/plugins && wget http://github.com/WordPress/sqlite-database-integration/archive/refs/heads/main.zip
RUN cd /usr/src/wordpress/wp-content/plugins && unzip main.zip
RUN rm /tmp//usr/src/wordpress/wp-content/plugins/main.zip
RUN cd /usr/src/wordpress/wp-content/plugins && mv sqlite-integration-main sqlite-integration
RUN cp /usr/src/wordpress/wp-content/plugins/sqlite-integration/db.php /usr/src/wordpress/wp-content

COPY wp-config.php /var/www/wp-config.php
RUN chown www-data:www-data /var/www/wp-config.php

VOLUME ["/var/www/db"]
