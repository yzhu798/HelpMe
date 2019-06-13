# 15 functions

FROM_UNIXTIME 可以将时间戳转换成字符串：

```
> SELECT FROM_UNIXTIME(0);
```

输出：1970-01-01 00:00:00

COUNT 得到记录的总数：

```
> SELECT COUNT(*) AS '年龄大于20的人数' FROM role WHERE age > 20; 
```
