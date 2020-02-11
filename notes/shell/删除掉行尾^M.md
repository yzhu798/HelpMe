# 删除掉行尾^M

windows文本文件行尾换行符就会和Linux不一样，下面是将其去掉的办法。

```bash
$ sed 's/\r$//g' old_file > tmp_file
$ rm -f tmp_file
$ mv tmp_file old_file
```
