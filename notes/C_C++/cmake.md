# cmake

cmake 可以用来生成项目工程文件，比如 Linux 下的 Makefile 等文件，VS下的 sln 等文件。cmake使用一个名为 CMakeLists.txt 的文件来描述项目构建过程。

使用 cmake 构建一个项目的流程如下：

1. 编写 CMakeLists.txt 文件

2. 使用 cmake 命令生成工程文件

3. 构建项目，比如 Linux 下可使用 make 命令，或直接使用 cmake 命令构建

## 安装

CentOS 7安装命令：

```shell
$ sudo yum install cmake
```

Ubuntu18.04 安装命令：

```shell
$ sudo apt-get install cmake
```

Windows下直接下载安装包即可：https://cmake.org/download/

## Start with Hello World

```cmake
# 如果 cmake 版本低于设定版本，则出错
cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

# 设定项目名字为 hello ，项目语言为 C
project(hello LANGUAGES C)

# 令 cmake 创建一个可执行程序 hello-world ，它由 hello-world.c 编译链接而来
add_executable(hello-world hello-world.c)
```

C++语言在cmake中写成 CXX 。

执行下面的命令生成项目工程：

```shell
$ mkdir -p build
$ cd build
$ cmake ..
```

项目工程生成在 build 目录下。

执行下面的命令构建：

```shell
$ cmake --build .
```

开启多线程编译：

```shell
$ cmake --build . -- -j 8
```

清理项目：

```shell
$ cmake --build . --target clean
```

若直接把 build 目录删掉，就完全清理掉工程了。

## 切换工程

查看当前平台可用的 generators ：

```
$ cmake --help
```

生成 Ninja 的工程：

```
$ mkdir -p build
$ cd build
$ cmake -G Ninja ..
```

## 构建库

```cmake
# 添加一个静态库 message ，它由 Message.h, Message.c 编译链接而来
add_library(message
	STATIC
	Message.h
	Message.c)
```

把 STATIC 修改成 SHARED 即可修改成共享库。

如果可执行程序需要对此库进行链接，那么在 add_executable 后面加上 target_link_libraries 即可。如：

```cmake
# 令 cmake 创建一个可执行程序 hello-world ，它由 hello-world.c 编译链接而来
add_executable(hello-world hello-world.c)

# hello-world 还需要链接 message 库
target_link_libraries(hello-world message)
```

## 设置变量

使用 set 命令设置变量。变量有内置的，也有自定义的。

```cmake
set(SRC hello.c)
```

引用变量：

```cmake
add_executable(hello ${src})
```

如果变量不存在，展开后的就是一个空内容。

可以在运行 cmake 的时候，用-D设置变量：

```
$ cmake .. -DCMAKE_BUILD_TYPE=debug
```

变量可以拿来做判断：

```cmake
set(USE_LIBRARY OFF)
if (USE_LIBRARY)
    add_library(message message.c message.h)
    add_executable(hello hello.c)
    target_link_libraries(hello message)
else()
    add_executable(hello hello.c message.c message.h)
endif()
```

OFF 代表关闭，if判断将失败，与之对应的是 ON 。

## 修改编译器

通过修改 CMAKE_C_COMPILER 内置变量修改默认C语言编译器：

```bash
$ cmake -DCMAKE_C_COMPILER=clang
```

## 修改编译选项

我们可以通过两种方法修改编译选项：

- 使用  target_compile_options 命令

- 修改 CMAKE_C_FLAGS, CMAKE_C_FLAGS_DEBUG, CMAKE_C_FLAGS_RELEASE 等内置变量

target_compile_options 使用如：

```cmake
target_compile_options(target
	PRIVATE
	${flags})
```

它表示 target 目标采用了 flags 编译选项，并且用 PRIVATE 表示这个选项仅应用于本目标。

如果改成 PUBLIC ，就表示依赖本目标的目标也采用 flags 。

如果设置了 CMAKE_BUILD_TYPE 内置变量，则：

- 没设置，采用 CMAKE_C_FLAGS
- 设置为 debug , 采用 CMAKE_C_FLAGS_DEBUG
- 设置为 release, 采用 CMAKE_C_FLAGS_RELEASE

## 判断平台

```cmake
if (CMAKE_SYSTEM_NAME STREQUAL "Linux")
	# Linux
elseif (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
	# MacOS
elseif (CMAKE_SYSTEM_NAME STREQUAL "Windows")
	# Windows
endif()
```

## 完整例子

### 单工程文件设定

```cmake
# 要求 cmake 最低版本
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

# 设置工程名
project(project_name)

# 自定义变量
set(INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
set(LINK_DIR ${PROJECT_SOURCE_DIR}/lib)
set(LIBS m)

# 设定编译选项
set(CMAKE_C_FLAGS "-g -Wall")
set(CMAKE_C_FLAGS_DEBUG "-g -Wall -D_DEBUG")
set(CMAKE_C_FLAGS_RELEASE "-Wall -DNDEBUG")

# 设定头文件包含目录
include_directories(${INCLUDE_DIR})

# 设定链接目录
link_directories(${LINK_DIR})

# 设定项目文件（递归搜索）
file(GLOB_RECURSE SRC_FILES
    ${PROJECT_SOURCE_DIR}/src/*.c
    ${PROJECT_SOURCE_DIR}/src/*.h)

# 设定输出目录
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/out)

# 设定可执行程序及生成它依赖的文件
add_executable(main ${SRC_FILES})

# 设定可执行程序依赖的库
target_link_libraries(main ${LIBS})
```

### 多工程文件设定

顶层 CMakeLists :

```cmake
cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

# 设置工程名
project(project_name)

# 自定义变量
set(INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
set(LINK_DIR ${PROJECT_SOURCE_DIR}/lib)
set(LIBS m)

# 设置编译选项
set(CMAKE_C_FLAGS "-g -Wall")
set(CMAKE_C_FLAGS_DEBUG "-g -Wall -D_DEBUG")
set(CMAKE_C_FLAGS_RELEASE "-Wall -DNDEBUG")

# 设定头文件包含目录
include_directories(${INCLUDE_DIR})

# 设定链接目录
link_directories(${LINK_DIR})

# 设定输出目录
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/out)

# 引入子项目
add_subdirectory(program)
```

子项目 CMakeLists :

```cmake
# 自定义变量
set(PROGRAM_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)

# 设定头文件包含目录
include_directories(${INCLUDE_DIR} ${PROGRAM_INCLUDE_DIR})

# 设定项目文件
file(GLOB_RECURSE SRC_FILES "*.c" "*.h")

# 设置可执行程序依赖的文件
add_executable(program_${CMAKE_BUILD_TYPE} ${SRC_FILES})

# 设置可执行程序依赖的库
target_link_libraries(program_${CMAKE_BUILD_TYPE} ${LIBS})
```

## 命令速查

|命令|举例|
|:-|:-|
|设置头文件包含目录|include_directories(. ./include)|
|设置链接库目录|link_directories(./lib)|
|在vs中设置筛选器|source_group(filter FILES ${SRC})|
|设置vs中启动项目|set_property(DIRECTORY PROPERTY VS_STARTUP_PROJECT "project" )|

其他：

设置一些自定义的命令。

例如，在生成前和生成后执行以下命令行的命令：

```cmake
# 生成前：更新一下 compileversion.cpp 文件，生成一个新的编译版本号
add_custom_command(TARGET EXEgameworld_${ARPG_BUILD_TYPE}
	PRE_BUILD
	COMMAND echo [PRE_BUILD] Update compileversion for gameworld
	COMMAND copy /B compileversion.cpp +,, > nul
	COMMENT "Update compileversion"
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/gameworld
)

# 生成完：将 EXEgameworld 拷贝到给 check_config
add_custom_command(TARGET EXEgameworld_${ARPG_BUILD_TYPE}
	POST_BUILD
	COMMAND echo [POST_BUILD] copy EXEgameworld for check_config
	COMMAND copy vsproject\\Debug\\EXEgameworld_debug.exe config\\server_opera_tools\\bin
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/
)
```

## 变量速查

|变量|说明|
|:-|:-|
|PROJECT_BINARY_DIR|build的目录|
|PROJECT_SOURCE_DIR|顶层CMakeLists.txt所在目录|
|CMAKE_CURRENT_SOURCE_DIR|当前处理的CMakeLists.txt所在路径|
|EXECUTABLE_OUTPUT_PATH|可执行程序的生成目录|
|LIBRARY_OUTPUT_PATH|库的生成目录|
