# mkdocs 使用

服务端教程的网页是用 mkdocs 生成的，这里记录一下 mkdocs 的使用方法。

---

**安装**

需求：python3.6 以及 pip

使用 get-pip.py 脚本来安装 pip 。

需要 python36 是安装 material 主题需要的。

```
python36 get-pip.py
pip install mkdocs
```

**启动服务**

```
python36 -m mkdocs serve -a 127.0.0.1:8000
```

**安装 material 主题**

```
python36 -m pip install mkdocs-material
```

**发布到 Github**

```
mkdocs gh-deploy [--force]
```