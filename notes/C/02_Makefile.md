# 02 Makefile

Makefile for build 01_helloworld.c:

```
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

```
%: %.cpp
```

可自行修改，以适应需求。