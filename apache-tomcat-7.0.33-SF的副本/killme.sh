#!/bin/bash
cdir=$(dirname `which $0`)
catom=${cdir##*-}
tompid=`ps aux|grep java|grep $catom|awk '{print $2}'`
echo $tompid
read -p "press enter to kill $catom..."
sleep 1
kill -9 $tompid
