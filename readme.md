# 仓库说明

> 1、本仓库是在纯官方编译指导的基础上增加了custom，所有的操作都是明文可见，绝不含任何后门操作。
>
> 2、也可以fork之后将custom.yml和custom文件夹删除后，即是官方指导的纯镜像。
>
> 3、具体请见build-axt1800.sh以及build-axt1800.yml。



### 一、官方固件

在开始之前，先放上[官方固件](https://dl.gl-inet.cn/?model=axt1800)的下载地址，以防止任何的不测。其他问题见[官方论坛](https://forum.gl-inet.cn/)。



### 二、自编固件

目录介绍如下：

```
.
├── .github // 隐藏文件
│   └── workflows // 用于github的流水线配置
│       ├── build-axt1800.yml // 具体的流水线作业定义
├── build-axt1800.sh // 具体fireware的编译脚本
├── custom.yml // 自定义插件配置
├── custom     // 自定义插件依赖
│   └── helloworld
│       ├── dns2socks...
│       ├── ipt2socks...
│       ├── microsocks...
│       └── redsocks2...
├── .gitignore // 请勿删除
└── readme.md
```



### 三、官方编译流程图

#### 3.1 gl-infra-builder流程

todo



#### 3.2 imagebuilder流程

todo
