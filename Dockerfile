FROM milanb/wordpress-sqlite

RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www

USER www-data:www-data
