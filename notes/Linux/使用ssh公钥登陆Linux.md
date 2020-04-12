# 使用ssh公钥登陆Linux

使用ssh登陆Linux系统有两种方式：

使用密码

使用公钥认证，双方各持公钥，客户机还会持有私钥

相对于使用密码，公钥认证的方式更加安全。

## 屏蔽密码登陆

修改文件：/etc/ssh/sshd_config

设置字段：PasswordAuthentication no

重启sshd服务：

```bash
$ systemctl restart sshd
```

## 生成密钥

```bash
$ ssh-keygen -t rsa
```

连续敲击三次回车生成密钥至目录：~/.ssh，id_rsa.pub即是要给服务端的公钥，id_rsa是客户机保留的私钥。

如果是windows系统，则可以使用SecureCRT工具生成：工具->创建公钥，一些关键步骤是：

- 密钥类型选择RSA
- 密钥格式选择OpenSSH
- 可以自定义密钥名

其余保持默认即可。

指定一个输出文件和一个key注释：

```bash
$ ssh-keygen -t rsa -f id_dev -C "id_dev"
```

## 加入公钥认证

将公钥的内容加入到文件： ~/.ssh/authorized_keys