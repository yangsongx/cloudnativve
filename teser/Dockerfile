FROM alpine:3.8
ENV PORT 8080
EXPOSE 8081

RUN sed -i '1 i\http://mirrors.ustc.edu.cn/alpine/v3.8/community/' /etc/apk/repositories
RUN sed -i '1 i\http://mirrors.ustc.edu.cn/alpine/v3.8/main/' /etc/apk/repositories

RUN apk add --update nginx
RUN mkdir /run/nginx/

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
