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

上述使用的技术是函数。Makefile里面可以加入一些函数，比如shell，会执行一个shell命令，将输出赋值给变量。

常用的函数：

|函数|功能|范例|
|:-:|:-:|:-:|
|wildcard|使用通配符得到文件|`wildcard *.c`|
|patsubst|替换内容，得到新的内容|`patsubst %.c,%.o,$(SOURCES)`|

## 一个项目模板

```makefile
CC=gcc
CFLAGS=-g -Wall

TARGET=main
SOURCES=$(wildcard *.c)
OBJS=$(patsubst %.c,%.o,$(SOURCES))

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

clean:
	@rm -fr *.o main

#############################################################
# auto generate below
```

`gcc -MM *.c` 可以获取当前目录下面的源文件的依赖关系，将其添加到模板的后面。