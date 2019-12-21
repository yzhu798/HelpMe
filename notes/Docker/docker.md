# 要素/概念

repo -> image -> container

每一个容器都是一个小型的Linux系统。

公共仓库：https://hub.docker.com/

# example

```bash
# 进入容器交互界面
$ docker exec -t ${container_id} /bin/bash

# 查看容器的信息
$ docker inspect ${continer_id}
```

# 镜像命令

```bash
# 查看当前拥有的镜像
$ docker images

# 查询镜像（从dockerhub上）
$ docker search ${image_name}

# 拉镜像(last version)
$ docker pull ${image_name}

# 删镜像(last version)
$ docker rmi ${image_name}
```

# 容器命令

## 运行相关

```bash
# 从镜像运行一个容器
$ docker run ${image_name}

# 交互模式运行容器
$ docker run -it ${image_name}

# 给容器命名
$ docker run --name ${container_name} ${image_name}

# 后台运行容器
$ docker run -d ${image_name}

# 端口映射
$ docker run -p ${local_port}:${container_port} ${image_name}

# 查看运行着的容器
$ docker ps

# 查看若干个历史容器
$ docker ps -n ${number}

# 查看所有历史容器
$ docker ps -a

# 查看容器运行日志
$ docker logs ${container_id}

# 详细日志操作 -t加入时间 -f跟随输出 --tail输出尾巴
$ docker logs -t -f --tail ${container_id}

# 查看容器运行进程
$ docker top ${container_id}

# 重返容器
$ docker attach ${container_id}

# 在外部让容器执行一个命令
$ docker exec -t ${container_id} "${cmd}"

# 拷贝文件到宿主主机
$ docker cp ${container_id}:${container_file} ${local_dir}
```

## 退出/启动/停止/删除

退回宿主机：ctrl + p + q

```bash
# 在交互式容器内退出
$ exit

# 启动旧的容器
$ docker start ${container_id}

# 重启容器
$ docker restart ${container_id}

# 停止容器
$ docker stop ${container_id}

# 强制关闭容器
$ docker kill ${container_id}

# 删除停止的容器
$ docker rm ${container_id}
```

# 提交容器

提交容器副本使之成为一个新的镜像。

```bash
# tag是版本号，比如1.2
$ docker commit -m="commit msg" -a="author" ${container_id} ${new_image_name}:${tag}
```