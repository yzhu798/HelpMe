# shell scripts

一些脚本。

依赖配置脚本 db_config.sh

其他脚本使用，客户不使用。

```bash
DB_USER=diwen
DB_PASSWD=123456

DB_CMD="mysql -u $DB_USER -p${DB_PASSWD}"

# 用 ps aux | grep mysql 查询--socket选项值
#DB_CMD="mysql -u $DB_USER -P${DB_PASSWD} --socket=/data/game/mysql/mysql-3306.sock"
```

清空数据库脚本 db_clear.sh

use: `db_clear.sh <dbname>`

```bash
#! /bin/bash

source ./db_config.sh

f_main()
{
	local force_flag=false
	if [ "$1" = "-f" ]; then
		force_flag=true
		shift 1
	fi

	local db_name=$1

	if [ -z $db_name ]; then
		echo "usage: $0 [-f] dbname"
		exit 1
	fi

	local db_cmd="$DB_CMD --skip-column-names $db_name -e"

	if ! $db_cmd "" ; then
		echo "can not connect to database $db_name"
		exit 1
	fi

	if [ "$force_flag" = "false" ]; then
		echo "all tables of $db_name will be cleared, make sure you have stopped the server."
		echo "continue?[y/n] "
		read ok
		if [ "$ok" != "y" ]; then
			exit 0
		fi
	fi

	echo "clearing all tables..."

	local tables=$($db_cmd "show tables" | awk '{print $1}')
	
	local cnt=0
	for t in $tables ; do
		$db_cmd "delete from $t"
		cnt=$((cnt + 1))
	done
	echo "$cnt tables of $db_name have been cleared"
}

f_main $@
```