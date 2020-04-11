# 搭建svn服务器

搭建环境：CentOS7

CentOS7可能已经默认安装了svn服务器，输入下列命令验证：

```bash
$ svnserve --version
```

但可能没有安装svn客户端，使用下列命令安装：

```bash
$ yum install svn
$ svn --version
```

## 搭建步骤

```bash
# 创建一个仓库
$ mkdir -p /data/repo
$ cd /data/repo
$ svnadmin create .

# 创建一个项目
$ cd
$ mkdir project
$ svn import project file:///data/repo/project -m "初始化"
$ rm -fr project

# 启动svn服务
$ svnserve -d -r /data/repo

# 拉取项目，如果是从另一台机器拉，则把IP地址改成对外的地址
$ svn co svn://127.0.0.1:3690/project
```

## 权限设定

进入到仓库目录的conf目录，修改svnserve.conf文件中的一些字段：

```bash
anon-access = none #禁止其它用户的访问
auth-access = write
password-db = passwd
authz-db = authz
```

如果要添加一个用户，修改passwd文件。

如果要给用户权限，修改authz文件。

修改passwd和authz目录后，不需要重启服务即可生效。