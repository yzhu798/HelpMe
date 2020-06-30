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

# 自动设定密码

如果在脚本中设置了密码，会被提示警告。如果不设置密码，就要手动输入，这是个麻烦的工作。

解决方法是，建立一个文件，比如 my.passwd , 内容是：

```
[client]
user=root
password=123456
```

然后使用如下语句运行mysql：

```
mysql --defaults-extra-file=my.passwd
```