# 02 Makefile

Makefile for build 01_helloworld.c:

```makefile
# 02_Makefile
CC = gcc
CFLAGS = -g -Wall -std=c99

all: 01_helloworld

clean:
	-rm -f 01_helloworld
```

build:

```
$ make -f 02_Makefile
```

## How?

采用内置规则自动build。

此内置规则为：

```makefile
%: %.c
```

可自行修改，以适应需求。

## More

有时候需要获取shell的输出，方便写makefile:

```makefile
MYSQL_INCLUDE = $(shell mysql_config --cflags) # 把 mysql_config --cflags 的输出内容赋给 MYSQL_INCLUDE
```