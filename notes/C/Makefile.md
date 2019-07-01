# Makefile

Makefile for build helloworld.c:

```makefile
# Makefile
CC = gcc
CFLAGS = -g -Wall -std=c99

all: helloworld

clean:
	-rm -f helloworld
```

build:

```
$ make
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

如果想build更快，可以采用多线程编译：

```
$ make -j8
```

采用了8个线程。