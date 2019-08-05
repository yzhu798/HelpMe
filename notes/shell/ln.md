# ln

ln 命令用来创建硬链接或者软链接。

```bash
ln foo foo_ln
```

创建一个硬链接 foo_ln 。如果链接存在，则会有错误提示。

```bash
ln -f foo foo_ln
```

强行创建硬链接，如果链接存在，无妨。

```bash
ln -s foo foo_symbol_ln
```

创建一个软链接 foo_symbol_ln 。如果链接存在，则会有错误提示，加-f去掉。