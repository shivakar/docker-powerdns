#!/usr/bin/env bash

mkdir -p /run/php-fpm
#ln -sf /dev/fd/1 /var/log/php-fpm/error.log
#ln -sf /dev/fd/1 /var/log/php-fpm/www-error.log

#sed -i 's/;log_level = notice/log_level = debug/g' /etc/php-fpm.conf

yes '' | pecl install mcrypt
echo "extension=mcrypt.so" >> /etc/php.ini

/usr/sbin/php-fpm -F
