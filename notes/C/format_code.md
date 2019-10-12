# format code

use astyle:

```bash
astyle --style=stroustrup --indent=tab --align-pointer=type --recursive ./*.c,*.h

find . -name "*.orig" | xargs rm -f
```

How to install: 

```
$ sudo apt install astyle
```

# format failed reason

最好把文件弄成unix下的utf-8格式。windows下面的文件换行符会影响到格式化。

使用下面的脚本把这个换行符干掉：

```bash
#! /bin/bash

# cut the last ^M of the line
if [ "$1" = "" ]; then
        echo "no input file"
        exit 1
fi

tr -d "\015" < $1 > $1.bak
mv $1.bak $1
```

# vscode extension

Astyle

安装后，打开一个源文件，右键 -> format document 即可。

打开 setting ，设置格式化命令：

```json
"settings": {
        "astyle.cmd_options": ["--style=allman", "--indent=tab", "--align-pointer=type"],
}
```