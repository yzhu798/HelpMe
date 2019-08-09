# 01 install

install command:

```
$ sudo apt-get install mariadb-server mariadb-client
```

查看服务状态：

```
$ systemctl status mariadb
```

启动服务：

```
$ sudo systemctl start mariadb
```

# More

如果Mysql出现了故障，最简单的解决方法就是重装。

卸载的命令是：

```bash
$ sudo apt autoremove mariadb-server mariadb-client
```
