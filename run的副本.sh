#!/bin/sh
cat /apache-tomcat-7.0.33-SF/hosts_addr >> /etc/hosts
/bin/sh /apache-tomcat-7.0.33-SF/bin/startup.sh && tail -f /apache-tomcat-7.0.33-SF/logs/catalina.out
