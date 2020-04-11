# g++ options

|选项|功能|
|-|-|
|-g|加入调试信息|
|-Wall|打开大部分warning|
|-Wconversion|打开类型转换相关的warning|
|-Werror|把warning视为error|
|-Wxxx|打开xxxwarning|
|-Wno-xxx|把xxxwarning关闭|

# 编译obj

```shell
$ g++ -c main.cpp -o main.o
```

# 指明头文件路径

```shell
$ include_dir=some_where
$ g++ -I${include_dir} main.cpp
```