# 02 create user

刚安装完毕，需要用 root 登录，并创建一个新的账号。

first login mysql client:

```
$ su -
# mysql
```

create mysql user diwen with password 123456:

```
> GRANT ALL ON *.* TO diwen@'%' IDENTIFIED BY '123456';
> FLUSH PRIVILEGES;
```

这条命令创建的是一个拥有所有权限的用户，可以从任何机器登录。

退回普通用户，使用刚才创建的用户(diwen)登录mysql client:

```
$ mysql -u diwen -p
```

## More

使用创建用户命令：

```
> CREATE USER wow;
```

创建了一个用户`wow@%`, 他没有什么可用的权限，只能登录，也没有密码。

创建用户的同时指定密码：

```
> CREATE USER wow@'localhost' IDENTIFIED BY '123456';
```

查看这个用户的权限：

```
> SHOW GRANTS for wow;
```

查看当前所有的用户：

```
> SELECT USER, HOST FROM mysql.user;
```

删掉这个用户：

```
> DROP USER 'wow'@'%';
```

### 修改用户的权限

```
$ su - 
# mysql
> GRANT ALL ON foo.* TO wow@'localhost' IDENTIFIED BY '123456';
```

这其实会创建一个用户，假如没有 wow@localhost 的话。
