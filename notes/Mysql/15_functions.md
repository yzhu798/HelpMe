# 15 functions

**CURRENT_USER** 可以查看当前会话用户：

```
> SELECT CURRENT_USER();
```

**PASSWORD** 获取加密后的密码：

```
> SELECT PASSWORD('123456') AS '123456密文';
```

**FROM_UNIXTIME** 可以将时间戳转换成字符串：

```
> SELECT FROM_UNIXTIME(0);
```

输出：1970-01-01 00:00:00

**COUNT** 得到记录的总数：

```
> SELECT COUNT(*) AS '年龄大于20的人数' FROM role WHERE age > 20; 
```
