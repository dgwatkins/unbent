FROM wordpress:6.4.1-php8.0-apache

RUN apt-get update && apt-get -y install wget unzip
RUN wget -O /tmp/plugin.zip http://github.com/WordPress/sqlite-database-integration/archive/refs/heads/main.zip
RUN unzip -d /usr/src/wordpress/wp-content/plugins /tmp/plugin.zip
RUN rm /tmp/plugin.zip
RUN mv /usr/src/wordpress/wp-content/plugins/sqlite-database-integration-main /usr/src/wordpress/wp-content/plugins/sqlite-integration
RUN cp /usr/src/wordpress/wp-content/plugins/sqlite-integration/db.copy /usr/src/wordpress/wp-content/db.php

COPY wp-config.php /var/www/wp-config.php
RUN chown www-data:www-data /var/www/wp-config.php

VOLUME ["/var/www/db"]
