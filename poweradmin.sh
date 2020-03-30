#!/usr/bin/env bash

cd /var/www/html

if [ ! -d poweradmin-2.1.7 ]; then
    curl -sLo poweradmin-2.1.7.tar.gz https://github.com/poweradmin/poweradmin/archive/v2.1.7.tar.gz
    tar xvf poweradmin-2.1.7.tar.gz
    mv poweradmin-2.1.7/* .
fi

ln -sf /dev/stdout /var/log/httpd/access_log
ln -sf /dev/stderr /var/log/httpd/error_log

httpd -D FOREGROUND
