FROM alpine:3.8
ENV PORT 8080
EXPOSE 8080

RUN sed -i '1 i\http://mirrors.ustc.edu.cn/alpine/v3.8/community/' /etc/apk/repositories
RUN sed -i '1 i\http://mirrors.ustc.edu.cn/alpine/v3.8/main/' /etc/apk/repositories

RUN apk add --update nginx
RUN mkdir /run/nginx/

COPY ./src/index.html /var/www/index.html
COPY ./src/web.conf /etc/nginx/conf.d/default.conf


CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
