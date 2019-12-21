# vs code

---

## 设置 terminal

修改 settings.json, 添加:

```json
// git bash
"terminal.integrated.shell.windows": "C:/Program Files/Git/bin/bash.exe",
```

## 设置字体

ctrl + shift + p 呼叫 Open Settings(JSON) ,加入:

"editor.fontFamily": "Consolas, 'Courier New', monospace",

设置 snippets:

ctrl + shift + p 呼叫 Configure User Snippet ，修改 c.json 。例子：

```json
"Main function": {
    "prefix": "main",
    "body": [
        "main(int argc, char* argv[])",
        "{",
        "\t$0",
        "",
        "\treturn 0;",
        "}",
    ],
    "description": "Main function for c"
},
```

## 设置 Linux 搜索路径

打开文件　c_cpp_properties.json ,在 configurations 标签内加入:

"/usr/**"

例子:

```json
{
    "configurations": [
        {
            "name": "Linux",
            "includePath": [
                "${workspaceFolder}/**",
                "/usr/**"
            ],
            "defines": [],
            "compilerPath": "/bin/gcc",
            "cStandard": "c11",
            "cppStandard": "c++14",
            "intelliSenseMode": "clang-x64"
        }
    ],
    "version": 4
}
```

## 自动猜文件编码格式

修改 settings.json ，增加：

"files.autoGuessEncoding": true