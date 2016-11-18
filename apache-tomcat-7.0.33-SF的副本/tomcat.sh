#!/bin/bash
# chkconfig: 2345 10 90
cdir=$(dirname `which $0`)
catom=${cdir##*-}
catom=${cdir##*/}
  # description: Starts and Stops the Tomcat daemon.
  TOMCAT_HOME=/opt/$catom
  TOMCAT_START=$TOMCAT_HOME/bin/startup.sh
  TOMCAT_STOP=$TOMCAT_HOME/bin/shutdown.sh
  # necessary environment variables export
  CATALINA_HOME=$TOMCAT_HOME
  export JAVA_HOME=/usr/java/jdk1.7.0_21
  # source function library.
  . /etc/rc.d/init.d/functions
  # source networking configuration.
  # check for tomcat script
  if [ ! -f $TOMCAT_HOME/bin/catalina.sh ]
  then echo "Tomcat not valilable..."
  exit
  fi
  start(){
  echo -n "Starting Tomcat: "
  daemon $TOMCAT_START
  echo
  touch /var/lock/subsys/tomcat$catom
  }
  stop(){
  echo -n $"Shutting down Tomcat: "
  daemon $TOMCAT_STOP
  rm -f /var/lock/subsys/tomcat$catom echo
  }
  restart(){
  stop

  start
  }
usage() {
echo usage: $0 start|stop|restart
}

case "$1" in
start)
start ;;
stop)
stop ;;
restart)
stop
sleep 15
tompid=`ps aux|grep java|grep $catom|awk '{print $2}'`
if [ -n "$tompid" ]  ;then
 kill -9 $tompid
fi
sleep 2
start ;;
*)
usage ;;
esac
