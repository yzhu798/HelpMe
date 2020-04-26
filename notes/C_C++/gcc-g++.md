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

# 开启优化

使用 -O2 可以开启O2优化，对于STL而言，此优化至少能提高4倍以上的执行速度。它可以保持-g，保有调试符号，但不完全。