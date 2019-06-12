# 03 static library

创建文件 03_helloworld.c:

```c
#include <stdio.h>

void helloworld()
{
    printf("Hello World\n");
}
```

build static library:

```
$ gcc -o 03_helloworld.o -c 03_helloworld.c
$ ar crv libhelloworld.a 03_helloworld.o
```

查看符号表：

```
$ nm libhelloworld.a | grep helloworld
0000000000000000 T helloworld
```

T表示符号位于代码区。

## Link static library

假设有一个 main.c 文件，要使用库。

```
$ gcc -o main.o -c main.c
$ gcc -o main main.o libhelloworld.a
```
