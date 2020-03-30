FROM centos:8

ENV MYSQL_HOST 127.0.0.1
ENV MYSQL_USER powerdns
ENV MYSQL_PASSWORD powerdns
ENV MYSQL_DATABASE powerdns
ENV MYSQL_INITIALIZE_DB ""

RUN yum install -y epel-release && \
        yum install -y mariadb pdns pdns-recursor pdns-backend-mysql && \
        yum install -y httpd php php-devel php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-mhash php-mysqlnd gettext libmcrypt-devel make && \
        yum install -y supervisor && \
        yum clean all

COPY powerdns.sh /powerdns.sh
RUN chmod +x /powerdns.sh

COPY poweradmin.sh /poweradmin.sh
RUN chmod +x /poweradmin.sh

COPY php-fpm.sh /php-fpm.sh
RUN chmod +x /php-fpm.sh

COPY supervisord.conf /etc/supervisord.conf

VOLUME [ "/var/www/html" ]

ENTRYPOINT [ "/usr/bin/supervisord" ]
