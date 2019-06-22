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
