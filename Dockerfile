FROM rhamdeew/docker-php-84-fpm-alpine
#RUN usermod -u 1050 www-data && groupmod -g 1050 www-data
RUN apk add --no-cache php84-pdo_pgsql \
    && ln -sf /usr/lib/php84/modules/pdo_pgsql.so /usr/local/lib/php/extensions/no-debug-non-zts-20240924/pdo_pgsql.so \
    && echo "extension=pdo_pgsql" > /usr/local/etc/php/conf.d/pdo_pgsql.ini

RUN apk add --no-cache php84-mysqli php84-pdo_mysql \
    && ln -sf /usr/lib/php84/modules/mysqli.so /usr/local/lib/php/extensions/no-debug-non-zts-20240924/mysqli.so \
    && ln -sf /usr/lib/php84/modules/pdo_mysql.so /usr/local/lib/php/extensions/no-debug-non-zts-20240924/pdo_mysql.so

# Node.js + npm for building ProxySite frontend assets (Vite/Tailwind) inside the container
RUN apk add --no-cache nodejs npm

# bash: logs/rotate.sh (cron log rotation) requires it — Alpine's default shell is ash
RUN apk add --no-cache bash