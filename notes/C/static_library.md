# static library

创建文件 helloworld.c:

```c
#include <stdio.h>

void helloworld()
{
    printf("Hello World\n");
}
```

build static library:

```
$ gcc -o helloworld.o -c helloworld.c
$ ar crv libhelloworld.a helloworld.o
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
