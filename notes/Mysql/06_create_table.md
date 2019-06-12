# 06 create table

创建一张表role：

```
> use foo;
> edit
```

输入：

```
CREATE TABLE role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32)
);
```

再按一个;加回车确认。

查看role表结构：

```
> DESC role;
```

查看表role的创建语句：

```
> SHOW CREATE TABLE role\G
```

`\G`表示更易读的输出方式。

查看当前数据库中所有表：

```
> SHOW TABLES;
```

## More

可以为表设置更多key，从而用该key做索引会更快。

创建语句如：

```
CREATE TABLE role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32),

    KEY `name` (`name`)
);
```
