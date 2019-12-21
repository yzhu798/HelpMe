## 终端设定

modify /etc/security/limits.conf , 追加：

```
* hard nofile 65535
* soft nofile 65535
```

这表示为所有用户设定打开数量为 65535

重启终端，输入 ulimit -a 或者 ulimit -n 验证。

## X11 设定

修改 /etc/systemd/user.conf and /etc/systemd/system.conf

DefaultLimitNOFILE=65535

重启验证
