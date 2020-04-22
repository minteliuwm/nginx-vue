#指定 node 镜像对项目进行依赖安装和打包
FROM node:12.16.1-alpine AS builder

# 将容器的工作目录设置为 /app (当前目录，如果 /app 不存在，WORKDIR 会创建 /app 文件夹)
WORKDIR /app
COPY package.json /app/
RUN npm i --registry=https://registry.npm.taobao.org
COPY . /app
RUN npm run build

#指定 nginx 配置项目，--from=builder 指的是从上一次 build 的结果中提取了编译结果(FROM node:alpine as builder)，即是把刚刚打包生成的 dist 放进 nginx 中
FROM nginx
COPY --from=builder app/dist /usr/share/nginx/html/
COPY --from=builder app/nginx.conf /etc/nginx/conf.d/

#暴露容器 80 端口
EXPOSE 80
