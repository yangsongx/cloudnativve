FROM alpine:3.8

ENV PORT 8080
EXPOSE 8080

RUN echo 'http://mirrors.ustc.edu.cn/alpine/v3.8/community/' >/etc/apk/repositories
RUN echo 'http://mirrors.ustc.edu.cn/alpine/v3.8/main/' >>/etc/apk/repositories


RUN apk add nginx
RUN mkdir /run/nginx/

COPY ./src/index.html /var/www/index.html
COPY ./src/web.conf /etc/nginx/conf.d/default.conf

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
