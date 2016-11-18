#!/bin/bash
usage(){
echo -e 'Error! \nUsage: $0 project_name'
}
#[ $# -ne 1 ] && eval "usage; exit 9"
#proj=$1
proj=$(find webapps/ -maxdepth 1 -type d |tail -n1)
proj=${proj##*/}
[ $# -eq 1 ] && proj=$1
#echo $proj
#exit
dd=$(date +%Y%m%d-%H%M)
cdir=$(dirname `which $0`)
catom=${cdir##*-}
cd webapps
tar czf $proj.$catom.$dd.tgz $proj
echo $proj.$catom.$dd.tgz generated ok
