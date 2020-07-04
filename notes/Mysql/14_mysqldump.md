# 14 mysqldump

备份数据库foo的所有表，包含数据:

```
$ mysqldump -u diwen -p foo > foo_bak.sql
```

加-d则表示只转储结构。

备份数据库foo中的role表：

```
$ mysqldump -u diwen -p foo role > role_bak.sql
```

恢复数据库表：

```
$ mysql -u diwen -p foo < foo_bak.sql
```

## More

mysqldump 默认会输出dump的日期，有时候没有必要（比如自动dump并提交SVN），可以用此选项关闭：

```
--dump-date=0
```

旧的mysql cli会提示1109的错误，使用以下选项避免：

```
--column-statistics=0
```

一个实用的命令：

```
$ mysqldump --defaults-extra-file=./my.passwd -h 192.168.9.30 --column-statistics=0 --dump-date=0 -d foo > foo.sql
```
