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

# index count
indices_count() {
  local indexfilter=$1
  for addr in $(echo ${ESADDR} |sed -e 's/,/ /g')
  do
    curl -XGET "http://$addr/_cat/count/$indexfilter*?h=count" 2>/dev/null
    [ $? -eq 0 ] && break
  done
}


# 检查类型
case $1 in
  count)
    indices_count $2
  ;;
  *)
    echo "ERROR: monitor type $1 error." >&2
esac


