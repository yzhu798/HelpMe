# 11 alter table

修改表role，增加一列age：

```
> ALTER TABLE role ADD COLUMN age INT DEFAULT 0;
```

修改表role，删除age列：

```
> ALTER TABLE role DROP COLUMN age;
```

删除列后，改列上的所有数据都被删掉。

修改表role的name列属性：

```
> ALTER TABLE role CHANGE COLUMN name name VARCHAR(64) DEFAULT '';
```
