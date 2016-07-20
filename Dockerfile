FROM centos:7
MAINTAINER Elvin Tan <elvin@elvin.net>
RUN yum -y install epel-release && yum -y update && yum -y install nginx
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80/tcp
VOLUME ["/www"]
ENTRYPOINT ["/usr/sbin/nginx","-c","/etc/nginx/nginx.conf"]
# docker run -d --name=nginx -v /opt/www:/www -p 80:80 visago/nginx
