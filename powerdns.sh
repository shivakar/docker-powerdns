#!/usr/bin/env bash

if [ -n "$MYSQL_INITIALIZE_DB" ]; then
    echo "Initializing database"
    mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /usr/share/doc/pdns/schema.mysql.sql
fi

cp -f /etc/pdns/pdns.conf /etc/pdns/pdns.conf.bak
cat > /etc/pdns/pdns.conf << EOF
launch=gmysql
gmysql-host=$MYSQL_HOST
gmysql-user=$MYSQL_USER
gmysql-password=$MYSQL_PASSWORD
gmysql-dbname=$MYSQL_DATABASE
EOF


/usr/sbin/pdns_server --daemon=no --guardian=no --loglevel=9
