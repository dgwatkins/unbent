FROM wordpress:fpm-alpine

RUN apk add --update curl unzip && rm -Rf /var/cache/apk/*
RUN curl -o /tmp/wpplugin.zip https://downloads.wordpress.org/plugin/sqlite-integration.1.8.1.zip
RUN unzip /tmp/wpplugin.zip -d /usr/src/wordpress/wp-content/plugins/
RUN rm /tmp/wpplugin.zip
RUN cp /usr/src/wordpress/wp-content/plugins/sqlite-integration/db.php /usr/src/wordpress/wp-content

COPY wp-config.php /var/www/wp-config.php
RUN chown www-data:www-data /var/www/wp-config.php

VOLUME ["/var/www/db"]
