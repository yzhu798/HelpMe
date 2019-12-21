# VirtualBox 挂载新的硬盘

---

## 添加硬盘、分区、格式化

添加一个硬盘：

先关闭虚拟机。设置 -> 存储 -> SATA控制器，右键，选择添加虚拟硬盘，根据向导创建一个硬盘。

查看现有系统的磁盘空间：

```shell
sudo fdisk -l
```

新添加的虚拟硬盘一般名称是：Disk /dev/sdb

PS: sda, sdb, sdc ... 这样顺下去

给新加的硬盘分区：

```shell
fdisk /dev/sdb

# 键入m查看帮助信息
command(m for help):m

# 增加新分区
command(m for help):n

# 选择基本分区，输入p

# 建一个分区
Partition number(1-4):1

# 回车
First cylinder (1-15908,default 1):Enter

# 写入并退出
command (m for help):w
```

格式化磁盘分区：

```shell
# 用ext4格式对/dev/sdb1进入格式化
sudo mkfs.ext4 /dev/sdb1
```

## 挂载硬盘分区

挂载分区：

```shell
# 创建新的挂载点
sudo mkdir /data

# 将新磁盘分区挂载到/data目录下
sudo mount -t ext4 /dev/sdb1 /data

# 查看挂载
df -h
```

设置开机自动挂载：

先打开文件：`sudo vim /etc/fstab`

在最后一行加入：`/dev/sdb1 /data ext4 errors=remount-ro 0 1`