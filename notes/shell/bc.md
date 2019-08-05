# bc

bc命令用来支持算术运算。它默认是交互模式运行的，但可以用管道传递算术表达式给它，获取输出。

```bash
res=$(echo "5 / 5" | bc -l)
echo $res
```

结果是1.25。

bc -l 表示启用一个标准的数学库，它默认支持浮点运算。

```bash
res=$(echo "4 * 5" | bc -l)
echo $res
```

结果是20。

bc 可以用于进制转换：

```bash
echo "obase=16;20" | bc
```

设置输出进制为16进制，默认输入进制为10进制，输入数字为20，输出它的16进制表示，结果是14。

输入进制选项为ibase。

## 工具程序

```bash
# 计算输出算术表达式的结果
f_calc()
{
    expression="$1"
    if [ -z "$expression" ]; then
            return 1
    fi
    echo "$expression" | bc -l
}
```

```bash
# 16进制转10进制
f_hextodec()
{
    echo "obase=10;ibase=16;$1" | bc
}

# 10进制转16进制
f_dectohex()
{
    echo "obase=16;ibase=10;$1" | bc
}

# 2进制转10进制
f_bintodec()
{
    echo "obase=10;ibase=2;$1" | bc
}

# 10进制转2进制
f_dectobin()
{
    echo "obase=2;ibase=10;$1" | bc
}

# 16进制转2进制
f_hextobin()
{
    echo "obase=2;ibase=16;$1" | bc
}

# 2进制转16进制
f_bintohex()
{
    echo "obase=16;ibase=2;$1" | bc
}
```
