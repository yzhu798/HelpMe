# debug by gdb

加入-g编译选项（编译链接都加），才令可执行程序支持gdb调试。

**启动并调试一个程序**

```
$ gdb prog
```

**附加进程调试**

```
$ gdb -p PID
```

**调试一个core文件**

```
$ gdb prog core
```

**调试死循环**

直接gdb附加进程后，使用bt命令查看调用堆栈即可。

## 常用调试命令

```gdb
> set args [arg_list]   # 设置程序的启动参数
> set print pretty on   # 友好的输出格式

> p variable            # 查看变量内容
> ptype variable        # 查看变量的定义

> bt                    # 查看调用堆栈
> f n                   # 跳到第n个stack frame
> n                     # step over
> s                     # step in
> finish                # 直接执行完当前的函数（仍保持断点调试状态）
> b file:line           # 在文件的某一行设置断点
> delete break          # 删除所有的断点

> q                     # 退出调试
> c                     # 继续执行程序
> run                   # 开始执行程序
> handle SIGINT nostop pass # 忽略掉 SIGINT 信号, 使其可以传递给调试程序, 默认gdb会拦截掉 SIGINT 信号
```

可以这样输出数组中有限数量的元素：

```gdb
(gdb) p array[0]@3
```

如上，输出了数组 array 从第0个元素开始后三个元素。

## 使用脚本调试

gdb加入参数-x script，即可使用脚本调试。

脚本模板：

```gdb
b somewhere [if ... [&&] ... [||] ...]
c
p some_variables
q
```

可以在break后接commands命令，在每次触发断点后直接打印一些值：

```gdb
b somewhere
commands
printf "%d\n", some_number
c
end
c
```

脚本调试时, 可以修改变量的值, 或者调用函数, 方法是:

- 修改变量的值: set var = 42
- 调用函数: call this->SomeFunc(paramlist)

函数调用需要把参数填写满。

## core 文件

令程序在崩溃时生成core文件：修改 .bashrc 或 /etc/profile，添加`ulimit -c unlimited`。意思是生成无限制大小的 core 文件。

core 文件默认产生在程序的执行路径，如果要设置 core 文件产生的路径，需要这样：

```bash
su -
echo "core-%e-%t" > /proc/sys/kernel/core_pattern # 生成到程序执行路径
echo "/tmp/coredump/core-%e-%t" /proc/sys/kernel/core_pattern # 生成到 /tmp/coredump
```

参数的意思是：

- %e 启动程序
- %t core 文件产生时的 UNIX 时间戳
- %p 程序的 pid
- %s 产生的信号