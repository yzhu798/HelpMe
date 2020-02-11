# yum

---

## 常用操作

```shell
# 查看软件列表
yum list gcc*

# 安装软件
yum install gcc.x86_64

# 卸载软件
yum remove gcc.x86_64
```

如果加上 -y 选项，表示对于交互式提问，都回答 yes 。

## 配置源

```shell
# 切换到源的文件目录
cd /etc/yum.repos.d

# 添加新的源的文件

# 清理 cache
yum clean all
```