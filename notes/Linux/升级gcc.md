# 升级GCC

今天学习C++ Primer中的正则表达式部分的时候遇到一个问题，运行书本的程序后，必然会抛出regex_error的异常，在stackoverflow上面看到这是因为编译器版本的问题，我当前的gcc版本是4.8.5，还没能全部支持正则表达式库，需要升级到4.9.2。

升级的方法是从GNU官网上面下载相应的源码，然后本地编译安装。

步骤如下：

```bash
$ wget http://ftp.gnu.org/gnu/gcc/gcc-4.9.2/gcc-4.9.2.tar.gz
$ tar -xvf gcc-4.9.2.tar.gz

$ cd gcc-4.9.2
$ ./contrib/download_prerequisites # 自动解决依赖

$ mkdir build
$ cd build

$ ../configure -enable-checking=release -enable-languages=c,c++ -disable-multilib # 生成Makefile文件

$ make -j4 # 编译
$ make install

$ gcc -v
```

不过，这种方式还是太过于麻烦，由于网络原因，下载速度堪忧。而且编译也要等待很久。如果中途出现错误，是令人非常沮丧的。我认为像这样的安装，需要有经验的人来指导，才不会陷入苦恼。

更快捷的方法是使用scl来提升gcc版本。scl，即Software Collections，它允许在操作系统上运行不同版本的软件，比如不同版本的gcc。

## More

这里列出了所有的gcc版本： http://ftp.gnu.org/gnu/gcc/

鉴于网速原因，我将一些源码包上传到了我自己的 [FTP](ftp://diwen.org/pub/gcc/)