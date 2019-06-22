# 16 execute sql in shell

方法是使用 --execute 命令参数。

在shell下面，执行一条sql语句：

```
$ mysql -u diwen -p foo --execute="SHOW TABLES"
```

这种方式不需要在sql后面添加分号。

默认的查询会带列的名字，下面的方法把它去掉：

```
$ mysql -u diwen -p --skip-column-names --execute 'SELECT * FROM foo.role'
```