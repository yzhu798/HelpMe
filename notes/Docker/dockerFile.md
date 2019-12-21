
# Dockerfile simple example:

```dockerfile
# 我是注释
FROM centos
VOLUME ["/dataVolume1", "/dataVolume2"]
CMD echo "Finish"
CMD /bin/bash
```

build image:

```bash
$ docker build -f ./Dockerfile -t ldw/test .
```

# 查看一个镜像的 dockfile

- 去 hub.docker.com
- 搜索镜像
- 查看对应的链接

scratch -> 是元镜像

## 语法 cheatsheet

```dockerfile
# 基础镜像
FROM centos

# 镜像维护者
MAINTANER liudiwen <demon90s@163.com>

# 构建时要运行的命令
RUN echo "building..."

# 对外暴露的端口号
EXPOSE ${port}

# 在构建过程中设置环境变量
ENV EXE_PATH /tmp/bin

# 创建容器后，终端默认的目录
WORKDIR $EXE_PATH

# 添加文件到容器，自动解压缩
ADD somefile.tar.gz /tmp

# 拷贝文件到容器，不会解压缩
COPY somefile.tar.gz /tmp

# 设置一个容器数据卷，宿主主机的对应目录被默认指定(启动后用inspect查)
VOLUME ${dir}

# 指定容器启动时执行的命令，只有最后一个CMD命令被执行
CMD echo "hello"

# same as CMD，但追加命令
ENTRYPOINT echo "hello"
```