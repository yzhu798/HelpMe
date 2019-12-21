# 通过scl启用c++11

---

## 引入问题

开发服的GCC版本比较低（4.4.7），不能支持C++11语法，通过scl可以创建一个新的运行环境，从而解决这个问题。

SCL，即Software Collections，它允许在操作系统上运行不同版本的软件，比如不同版本的GCC。

官网：https://www.softwarecollections.org/en/

可以通过`man scl`查看scl命令的介绍。

scl命令可以在一个新的环境下（SCL环境）运行软件。

## 安装devtoolset

```
# 安装 devtoolset-4
yum install centos-release-scl
yum install devtoolset-4-toolchain
# or
yum install devtoolset-6-toolchain

# 验证
$ scl enable devtoolset-4 bash
$ gcc --version
```

如果有更高版本的，也可以安装高版本的。