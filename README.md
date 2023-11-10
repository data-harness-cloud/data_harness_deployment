# data_harness_deployment (驭数轻云数据中台) 构建

## 背景

此项目提供 `docker compose` 一键部署运行 `Data Harness (驭数轻云数据中台)`。提供以下软件环境：

- Data Harness v1.0.0
- MySQL 8.0.34
- Redis 7.2.0
- Minio RELEASE.2023-07-21T21-12-44Z

## 注意



## 快速上手

### :one: : 克隆仓库

```shell
# 克隆仓库
git clone https://github.com/data-harness-cloud/data_harness_deployment.git .
```

### :two: : 配置依赖变量

 ```shell
 # 修改 .env 文件
 cp .env.example .env
 
 vi .env
 ```


### :three: : 构建依赖镜像

```shell
# 构建镜像
docker compose build --no-cache data_harness_mysql data_harness_redis data_harness_minio
```

构建镜像的速度取决于服务器的性能、网络等，如果是离线部署，请提前准备好所需的镜像包

### :four: : 运行 `MySQL`, `Redis`, `Minio`

```shell
# 启动 MySQL、Redis、Minio
docker compose up -d data_harness_mysql data_harness_redis data_harness_minio
```

 等待片刻后需要手动初始化数据库(**初始化数据库只再第一次构建运行，系统启动成功后==禁止再次执行初始化操作==**)

 ```shell
 # 查看 MySQL 是否启动
 docker compose ps | grep data_harness_mysql
 # 如果出现 healthy 字样表示成功启动。redis minio 同理

 # 初始化数据库
 docker compose exec -i data_harness_mysql mysql -u supiedt -psupiedt666 data_harness < data_harness_mysql/initial.sql
 ```

### :five: : 构建并运行 `Data Harness`

在运行 Data Harness 之前，你要开放 8081 端口。

 ```shell
 docker compose build --no-cache data_harness_be data_harness_fe
# 启动
 docker compose up -d
 ```
 执行完成后，等待 一分钟 左右就可以访问了 访问用户名/密码为：`admin/supiedt666`
 访问地址为 .env 文件内 DATA_HARNESS_FE_EXTERNAL_URL 的参数，如 http://localhost:8081





 如果不想构建镜像，也可以使用我们提供的镜像：
 在 第二步 修改 .env 文件后 直接运行 `docker compose up -d`, 会从 hub.docker.com 拉取镜像。
 或者你的环境中已经有 Data Harness 运行所需依赖(mysql、redis、minio)的话，mysql 创建 `data_harness` 库后，导入 `data_harness_mysql/initial.sql` 文件， 编辑 .env 文件后 选择 自行编译镜像或者使用我们提供的镜像依你而定

## 卸载

```shell
docker compose down
docker rmi supiedt/data_harness_be:v1.0.0 supiedt/data_harness_fe:v1.0.0 supiedt/data_harness_minio:v1.0.0 supiedt/data_harness_mysql:v1.0.0 supiedt/data_harness_redis:v1.0.0
docker volume rm data_harness_deployment_data_harness_be data_harness_deployment_data_harness_fe data_harness_deployment_data_harness_minio data_harness_deployment_data_harness_mysql data_harness_deployment_data_harness_redis
```