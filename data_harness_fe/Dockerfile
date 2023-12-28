FROM reg.aidb.site/library/node:18.18.2-dev as builder
WORKDIR /app
RUN git clone https://gitee.com/data_harness_cloud/data_harness-fe.git .
RUN npm config set registry https://registry.npm.taobao.org 
RUN npm install
RUN npm run build:prod

FROM nginx:latest as release
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf.template /
EXPOSE 8081
CMD envsubst '$$DATA_HARNESS_API_URL' < /nginx.conf.template > /etc/nginx/nginx.conf \
	&& cat /etc/nginx/nginx.conf \
	&& nginx -g 'daemon off;'
