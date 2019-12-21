# Visual Studio

---

## 相关设置

**设置字体**

工具 -> 选项 -> 环境 -> 字体和颜色

蓝色或浅色主题下的项背颜色的护眼色（RGB）：204,232,207

**开启行号**

工具 -> 选项 -> 文本编辑器 -> 所有语言 -> 显示，开启行号

**资源管理器中跟踪源文件**

工具 -> 项目和解决方案 -> 常规，勾选在解决方案资源管理器中跟踪活动项

**取消中文的红色下划线**

顶部VAssistX -> Visual Assist Options -> Underlining -> 去掉Underline Spelling

**禁用IntelliSense**

这个功能会吃内存，而且和VA的功能有重叠，所以可以禁用掉。

工具 -> 选项 -> 文本编辑器-> C/C++ -> 高级， 右边 Disable Intellisense，False 改为 Ture

## VS快捷键

- 全局查询：ctrl + shift + f

- 搜索文件中的函数：alt + m

- 跳到下一个搜索位置：ctrl + f3

- 跳转大括号：ctrl + }

- 生成注释：ctrl + k，ctrl + c

- 取消注释：ctrl + k，ctrl + u

- ctrl + m + m: 折叠/展开当前语句块

- ctrl + m + l: 折叠/展开所有语句块

- 编译单个cpp文件：ctrl + f7

- 删除所有断点：ctrl + shift + f9

- 进入调试模式启动程序：f5

- 不进入调试模式启动程序：ctrl + f5

- 调试时跳出当前函数体：shift + f11

- 打开附加到进程窗口：ctrl + alt + p

- 大写转小写：ctrl + u

- 小写转大写：ctrl + shift + u

- 格式化代码：ctrl + k, ctrl + d

## VS其他功能

**使用断点+条件调试**

键入F9在一行下断点后，在断点右侧右键，即可开启条件断点。

**使用书签**

书签可以标记代码位置，并给予一个说明，可以快速定位。

打开书签窗口：视图 -> 书签窗口

**编译结束后不显示Error List**

菜单栏Tools -> Options -> Projects and Solutions -> General，取消掉 Always show Error List ...

**将执行程序放进菜单栏**

菜单栏Tools -> External Tools -> Add 一个menu项目

然后输入可执行程序的 Command, Arguments, Initial directory

Apply

## VA快捷键

- 搜索项目文件：alt + shift + o

- 找名字：alt + shift + s

- 查询引用：alt + shift + f

- 头文件和源文件切换：alt + o

- 转到定义：alt + g

- 退回上一个视图：alt + 左键

- 全局改名：alt + shift + r

## 其他功能

**快速包含头文件**

把鼠标放在类型名字上，按下面的箭头，可以找到自动添加头文件的按钮，或者键入 alt + shift + q，在弹出的选项中选择。

但是这样添加的头文件可能有格式的问题，比如使用了..，或者windows下的\符号，可能造成Linux下编译失败。因此还要检查一下。

**自定义代码片段**

打开编辑器：VAssistX -> Refector -> Edit Refactoring Snippets

然后就可以自行编辑代码模板。

**预编译头**

使用预编译头将比较固定的header file一次性打包编译，可以大量节约编译时间。

方法是：

- 创建一个文件stdafx.h，里面包含那些header file。创建一个stdafx.cpp文件，仅包含stdafx.h。然后右键stdafx.cpp文件 -> Properties -> C/C++ -> precompiled Header，选择Precompiled Header为：Create(/Yc)

- 右击项目 -> Properties -> C/C++ -> precompiled Header，选择Precompiled Header为：Use(/Yu)

- 项目中所有的cpp文件开头都需要`#include "stdafx.h"`

- OK

## vs2015安装其他的插件

菜单栏 Tools -> Extensions and Updates，右上方搜索即可，比如搜索VisualSVN。

实用的插件：

- Open Command Line

- VisualSVN


## 代码分析

**生成头文件依赖关系图**

菜单栏 Architecture -> Generate Graph of Include Files