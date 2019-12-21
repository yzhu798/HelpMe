# batch脚本

---

## 目录相关

```bat
rem 在D盘根目录创建一个目录test
md d:\test

rem 在当前目录创建一目录test
md test

rem 切换到当前目录下的test目录
cd test

rem 从任意目录切换到d:\project\testdos\test目录
cd /D d:\project\testdos\test

rem 删除test目录及其所有内容，不询问
rd /S /Q test
```

## 文件相关

```bat
rem 把test.txt文件复制到test目录下，不询问
copy /Y test.txt test\

rem 把test目录和其所有内容拷贝到d盘根目录下的test2目录
xcopy /S test d:\test2\

rem 更新file的修改日期为当前日期
copy /B file +,,

rem 修改文件名
ren old_name new_name

rem 删除文件
del file_name

rem 此命令删掉了当前目录及其子目录中所有文件，且不会提示任何信息
del /S /Q * > nul 2>&1
```

## 其他

```bat
rem 查看copy命令的使用方法
help copy

rem 把窗口标题设置为ug04_cn
title ug04_cn

rem 启动一个单独的窗口运行程序
start proccess.exe

rem 启动程序，但不创建新窗口，但程序会忽略CTRL + C
start /b proccess.exe

rem 输出hello，@的功能是让命令内容不回显
@echo hello

rem 关闭命令回显
@echo off

rem 输出换行
echo.

rem 暂停，输出自定义的提示，这里是完毕
echo 完毕 & pause > nul

rem 强制终止进程及其子进程
taskkill /f /t /im proccess.exe

rem 执行3次无效的ping（每次ping会间隔一小段时间），把输出丢弃
ping -n 3 127.0 > nul

rem 等待3秒，把输出丢弃
timeout /t 3 > nul
```

## 比较数字

	EQU - 等于
	NEQ - 不等于
	LSS - 小于
	LEQ - 小于或等于
	GTR - 大于
	GEQ - 大于或等于

## 脚本案例

判断：

```bat
@echo off

rem 接受输入一个字符串
set /p word=请输入一个单词: 
if %word%==hello (
	echo 你输入了hello
) else if %word%==world (
	echo 请输入了world
) else (
	echo 请输入hello或者world
)

pause
```

循环（从0到n）：

```bat
@echo off

rem 设置一个变量，/a表示此变量是数字
set /a var=0

rem 接受一个输入数字，表示循环次数
set /p n=请输入循环次数: 
:loop_beg
if %var% LSS %n% (
	echo %var%
	set /a var+=1
	goto loop_beg
) else (
	goto loop_end
)
:loop_end
pause
```