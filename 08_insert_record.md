# 08 insert record

向表role插入一些数据：

```
> INSERT INTO role(name) VALUES ('diwen'), ('meili'), ('miemie');
```

查看结果：

```
> SELECT * FROM role;
```

注意，主键 role_id 没设置值，它会自动增长。
