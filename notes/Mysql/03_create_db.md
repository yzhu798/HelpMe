# 03 create db

创建一个数据库foo：

```
> CREATE DATABASE foo;
```

查看数据库foo的创建语句:

```
> SHOW CREATE DATABASE foo;
```

## More

指定默认字符集和排序规则：

```
> CREATE DATABASE foo CHARACTER SET utf8 COLLATE utf8_general_ci;
```
