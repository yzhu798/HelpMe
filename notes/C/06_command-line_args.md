# 06 command-line arguments

获取命令行参数：

```
$ ./06_cmd bar 123 x
```

参数为：

argc: 4

argv: {"./06_cmd", "bar", "123", "x", NULL}

编写程序实验：

```c
#include <stdio.h>

int main(int argc, char* argv[])
{
    printf("argc: %d\n", argc);

    printf("argv: ");
    for (int i = 0; i < argc; i++)
    {
        printf("%s ", argv[i]);
    }
    printf("\n");

    return 0;
}
```
