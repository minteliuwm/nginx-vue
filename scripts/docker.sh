#! /bin/bash

# 停止服务
docker stop nginx-vue

# 删除镜像
docker rmi nginx-vue

# 构建镜像
docker build -t nginx-vue .

# 启动服务
docker run --rm=true -d --name nginx-vue -p 3000:80 nginx-vue

# 删除 id 为 none 的镜像
# docker rmi $(docker images | grep "^<none>" | awk "{print $3}")