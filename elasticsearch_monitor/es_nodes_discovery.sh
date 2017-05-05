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

# 连接es节点，获取索引，自动发现监控项
for addr in $(echo ${ESADDR} |sed -e 's/,/ /g')
do
  curl -XGET "http://$addr/" &>/dev/null
  [ $? -ne 0 ] && echo "WARN: connect to $addr failed." >&2 && continue

  # 获取索引列表
  # 日索引
  list=( $(curl -XGET "http://$addr/_cat/nodes?h=name" 2>/dev/null) )
  #echo -e "${list[*]}\n\n"

  #[ x$list = x ] && echo "ERROR: no discovery data list found." >&2 && exit 1
  # 将列表list，转换为发送给zabbx的json数据。
  length=${#list[@]}
  #printf "{\n"
  printf '{\"data\":[ '
  for ((i=0;i<$length;i++))
  do
    printf "{\"{#NAME}\":\"${list[$i]}\"}"

    if [ $i -lt $[ $length-1 ] ];then
      printf ','
    fi
  done
  #printf  "\n\t]\n"
  #printf "}\n"
  printf  " ]}"
  
  break
done

