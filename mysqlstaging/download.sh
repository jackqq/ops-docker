#!/bin/sh
set -e

OPS_VERSION="2.1"
OPS_FILE_DATE="20160419"

BASE=https://data.openphacts.org/free/${OPS_VERSION}/ims/
NAME=mysql-for-ims-${OPS_VERSION}-${OPS_FILE_DATE}.sql.gz

url=${BASE}${NAME}

rm -f *.sha1
#axel --alternate $url.sha1
wget $url.sha1

( cat ${NAME}.sha1 ; echo ' '${NAME} ) | sha1sum -c
sha1match=$?

if ! [ -f $NAME ] || ! (exit $sha1match) ; then
  #axel --alternate $url
  wget $url
fi

name=`echo *.sha1 | sed s/.sha1//`
(cat *.sha1 ; echo "  $name") | sha1sum -c  -

