# 使用 QT 编译项目（打开 CMakeList 文件，然后配置 Projects ）

# 快捷键（使用自定义的习惯）

Tools -> Options -> Keyboard

左下角可以打开查询说明。

搜索文件： alt + shift + o

切换头文件/源文件： alt + o

查询使用位置：alt + shift + f

查询函数：ctrl + m

关闭所有文档：ctrl + shift + w

从拷贝历史拷贝：ctrl + shift + v

go to line: alt + g

切换注释：ctrl + /

变大写：alt + shift + u
变小写：alt + u

折叠块：ctrl + < 记得加 shift
展开块：ctrl + >

跳 block: ctrl + [  ctrl + ]

全选 block：ctrl + u

分离窗口：shift + alt + w

# 使用 QT 启动

Projects Run Settings

## 默认打开的编码

Tool -> Options -> encoding

## 关闭 QT 后恢复上次会话

File -> Sessions

# 问题

## server compiling error

undefined reference to `MD5Init'

采用 g++4.8

## can not attach running program ...

su -
echo 0 | tee /proc/sys/kernel/yama/ptrace_scope

## 烦人的代码编辑器自动 warning

菜单栏 -> Help -> About Plugins -> C++ ，取消掉 ClangCodeModel

或者降低默认的提示水平：

菜单栏 -> Tools -> Options -> C++ -> Code Model -> Clang Code Model ，选择第一个

## 输入 tab 默认变成了4个空格

菜单栏 -> Tools -> Options -> C++ , copy 一个新的编码风格，然后修改

## Ubuntu下 QtCreator 不能输出中文（输入法采用 fcitx ）

输入 dpkg -L fcitx-frontend-qt5 查询 libfcitxplatforminputcontextplugin.so 所在。

然后，将这个文件拷贝到 QtCreator 的 Plugin 目录，在我的一台机子上，这个目录是：

~/Qt/Tools/QtCreator/lib/Qt/plugins/platforminputcontexts

重启 QtCreator

## 缺点

占用内存. 但可以关闭一些插件来减少.

## 编码错误, 无法编辑

先 Edit -> Select Encoding, reload 一个正确的 encoding, 然后再次 Edit -> Select Encoding, save 一个其他的 encoding.