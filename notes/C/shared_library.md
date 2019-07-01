# shared library

创建文件 helloworld.c:

```c
#include <stdio.h>

void helloworld()
{
    printf("Hello World from shared libary\n");
}
```

build shared library:

```
$ gcc -shared -o libhelloworld.so -fPIC helloworld.c
```

## Link shared library

假设有一个 main.c 文件，要使用库。

```
$ gcc -o main.o -c main.c
$ gcc -o main main.o -L. -lhelloworld
```

把库所在目录添加到 /etc/ld.so.conf 文件，然后执行：

```
$ sudo ldconfig
```

可以把当前目录`.`加入到 /etc/ld.so.conf 。

查看程序依赖的共享库：

```
$ ldd main
```