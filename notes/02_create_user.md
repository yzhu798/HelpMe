# 02 create user

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

退回普通用户，使用刚才创建的用户(diwen)登录mysql client:

```
$ mysql -u diwen -p
```
