#!/bin/sh
set -e
# wait for mysql
sleep 5 &

sql=/tmp/staging.sql
rm -f $sql
# empty file to start with
touch sql

cd /staging
# Forget about any incomplete staging
rm -rf staging
mkdir -p staging staged
for file in *.sql.gz ; do
  db=`echo $file | sed 's/\\.gz$//' | sed 's/\\.sql//'`
  staged=staged/$db
  staging=staging/$db
  if ! [ -f $staged ] ; then
    echo "Preparing to stage $db"
    echo "CREATE DATABASE IF NOT EXISTS $db;" >> $sql
    echo "USE $db;" >> $sql
    gunzip --stdout $file >> $sql
    touch $staging
  fi
done  

# To avoid password warnings..
echo "[client]" > /tmp/my.conf
echo "host=$MYSQL_PORT_3306_TCP_ADDR" >> /tmp/my.conf
echo "port=$MYSQL_PORT_3306_TCP_PORT" >> /tmp/my.conf
echo "user=root" >> /tmp/my.conf
echo "password=$MYSQL_ENV_MYSQL_ROOT_PASSWORD" >> /tmp/my.conf

# ensure at least 5 seconds has passed
echo "Waiting for mySQL"
wait
echo "mySQL staging"
ls -alh /tmp/staging.sql

mysql --defaults-file=/tmp/my.conf < $sql
# Mark as staged
mv staging/* staged/
echo "mySQL staging finished"
