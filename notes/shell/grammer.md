# grammer

## begining

```bash
#! /bin/bash
```

使用 bash 来解释shell脚本。

## 变量

变量都是字符串。

定义一个变量：

```bash
foo=bar
```

使用一个变量：

```bash
echo $foo
```

## 条件

shell中，0代表true，非0代表false。

使用 `[` 命令来测试一个条件判断是否为true。

```bash
read i
[ "$i" = "42" ] && echo "OK"
```

用 && 或者 || 将命令连接起来组成命令列表，执行顺序遵循短路规则。

读入42，则输出OK。

更多条件判断：

|字符串比较|结果|
|-|-|
|string1 = string2|如果字符串相等，返回真|
|string1 != string2|如果字符串不相等，返回真|
|-n string|如果字符串不为空则返回真|
|-z string|如果字符串为空则返回真|

|算术比较|结果|
|-|-|
|expr1 -eq expr2|两个表达式相等，返回真|
|expr1 -nq expr2|两个表达式不相等。返回真|
|expr1 -gt expr2|表达式1大于表达式2，返回真|
|expr1 -ge expr2|表达式1大于等于表达式2，返回真|
|expr1 -lt expr2|表达式1小于表达式2，返回真|
|expr1 -le expr2|表达式1小于等于表达式2，返回真|

|文件条件测试|结果|
|-|-|
|-d file|如果file是目录，则为真|
|-f file|如果file存在，则为真|
|-s file|如果file大小不为0，则为真|

## if

```bash
if foo; then
    echo "foo succ"
fi
```

当命令或函数 foo 返回0的时候，if条件成立。

```bash
if [ -f foo.c ]; then
    echo "foo.c exist"
elif [ -f bar.c ]; then
    echo "bar.c exist"
else
    echo "none exist"
fi
```

foo.c或bar.c则输出它们存在，否则输出不存在。

## for, while

```bash
for file in *; do
    echo "$file"
done
```

列出当前目录下的所有文件。\*做了扩展，获得当前目录的文件列表（不包含隐藏文件）。

```bash
i=0
while ((i < 5)); do
    echo $i
    i=$((i + 1))
done
```

输出0到4。`((...))`是算数运算的命令。

```bash
while true; do
    echo "hi..."
    sleep 1
done
```

无限循环。true和false直接表示了条件成功或失败。

可以使用 continue 结束本次循环，break 跳出循环。

## case

```bash
read opt
case "$opt" in
    yes|y)
        echo "yes"
        ;;
    no|n)
        echo "no"
        ;;
    *)
        echo "unknown"
        ;;
esac
```

输入yes或者no，然后执行对应分支。

## function

```bash
f_plus()
{
    echo $(($1 + $2))
}
```

计算加法的函数。

```bash
f_plus 3 4
```

调用函数，传入两个参数，输出7。

$1和$2表示第一个和第二个参数，$n表示第n个参数；$#表示参数个数；$@表示所有参数，用空格分开。