FROM registry.alauda.cn/library/java:7
MAINTAINER "Longwei Li <longwei.li@moji.com>"
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /apache-tomcat-7.0.33-SF
ADD ./apache-tomcat-7.0.33-SF/ /apache-tomcat-7.0.33-SF
ADD ./run.sh /apache-tomcat-7.0.33-SF/run.sh
RUN chmod 777 /apache-tomcat-7.0.33-SF/run.sh
ADD ./hosts_addr /apache-tomcat-7.0.33-SF/hosts_addr
EXPOSE 7011
CMD ["/bin/sh","/apache-tomcat-7.0.33-SF/run.sh"]
