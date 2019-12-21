
容器数据卷(data volume)是宿主机器和容器共享文件的通道。

```bash
# -v 目录映射 目录不存在就创建
$ docker run -v ${local_absolute_path}:${container_path} ${image_name} 

# 容器目录只读 加ro
$ docker run -v ${local_absolute_path}:${container_path}:ro ${image_name} 

# 新容器继承旧容器卷，当没有容器使用容器卷了，它才会被删掉
$ docker run -it --name ${container_name} --volumes-from ${old_container_name} ${image_name}
```