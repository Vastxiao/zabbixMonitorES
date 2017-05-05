#!/bin/bash
#
# Call to vastxiao.github.io
# Create at 20170411

PATH=/bin:/sbin:/usr/bin:/usr/sbin

#echo $0
cd $(dirname $0)
HOMEPATH=$(pwd)

source es_env.sh
[ $? -ne 0 ] && echo "ERROR: es_env.sh not not found." >&2 && exit 1

[ X$1 = X ] && echo "ERROR: type empty." >&2 && exit 1

for addr in $(echo ${ESADDR} |sed -e 's/,/ /g')
do
  curl -XGET "http://$addr/_cat/health?h=$1" 2>/dev/null
  [ $? -eq 0 ] && break
done
