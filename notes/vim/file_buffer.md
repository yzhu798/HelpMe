# file buffer

file buffer 保存了已经打开了的文件。

打开一个文件：

:find foo

查看在buffer中的文件：

:ls

选择一个缓存文件打开：

:bN

N是ls查看到的序号。

把缓存中的文件删了：

:bdelete N1 N2 ...

添加文件搜寻目录：

:set path+=dir