# 13 select

查看role表所有记录，列出name列：

```
> SELECT name FROM role;
```

查看age大于20的记录：

```
> SELECT name AS '姓名', age AS '年龄' FROM role WHERE age > 20;
```

AS的功能是给列起一个别名。

根据年龄从小达到排列记录：

```
> SELECT * FROM role ORDER BY age;
```

从大到小：

```
> SELECT * FROM role ORDER BY age DESC;
```

ASC是从小到大，也是默认设置。