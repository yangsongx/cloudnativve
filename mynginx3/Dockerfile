FROM centos:latest

ENV PORT 8080
EXPOSE 8080


RUN yum install epel-release -y \
      && yum install nginx -y \
      && yum install -y net-tools.x86_64 \
                        supervisor.noarch \
                        java-1.7.0-openjdk.x86_64

RUN mkdir -p /opt/proj/

COPY ./src/flume-1.7 /opt/proj/flume-1.7/
COPY ./src/index.html /usr/share/nginx/html/index.html
COPY ./src/web.conf /etc/nginx/nginx.conf

#COPY ./src/centos-fluent-bit /usr/bin/fluent-bit
COPY ./src/debian-fluent-bit /usr/bin/fluent-bit
COPY ./src/fluent_client.conf /opt/proj/fluent_client.conf
COPY ./src/supervisord.conf /opt/proj/supervisord.conf

# timezone setting on CentOS
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


#CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
CMD ["/usr/bin/supervisord", "-c", "/opt/proj/supervisord.conf"]
