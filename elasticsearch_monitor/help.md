# Elasticsearch monitor scripts for zabbix

**requirments**
- Linux
- zabbix3
- bash
- linux commands: curl, awk, grep, sort, uniq, sed ...
- support es > 5.0

**install**

1. Import zbx\_templates\_es\_cluster.xml to zabbix.
2. Copy elasticsearch_monitor directory to your zabbix agentd scripts path.
3. Copy userparameter_elasticsearch.conf to your zabbix agentd etc path,
 and you may change the path to your right agentd scripts path.
4. Config es\_env.sh and restart zabbix agentd process.
5. finaly, add the "Elasticsearch Cluster" to the host which should be monitor.


# About

Author: vastxiao.github.io
Date: 2017.04.11
