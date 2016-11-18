#!/bin/bash
usage(){
echo -e 'Error! \nUsage: $0 newdir olddir'
}
[ $# -ne 2 ] && eval "usage; exit 9"
echo " -------------------------------------------- "
ii=1
dir1=$1
dir2=$2
#echo $dir1 $dir2
xx=0
for files in `find $dir1 -type f`;do
file=`basename $files`
#echo $file
find $dir2 -type f -name $file > list.tmp
line=`wc -l <list.tmp`
if [ "$line" -eq 0 ]; then
echo "File $ii :$file --- no such file exits in dest dir."
let ii=ii+1
xx=1
elif [ "$line" -gt 1 ]; then
echo "File $ii :found $line same name file, here's filelist:"
cat list.tmp
xx=2
let ii=ii+1
else
#echo "found $line $file will be replaced, here's filelist:"
echo "File $ii :$file ok ,will overwrite this file:"
cat list.tmp
let ii=ii+1
fi
done
echo " -------------------------------------------- "
[ "$xx" -ne 0 ] && eval "echo check above info 1st; read -p 'press to continue...' "

#echo "ok, we can now start replace file..."

ii=1
for files in `find $dir1 -type f`;do
file=`basename $files`
#echo $file
find $dir2 -type f -name $file > list.tmp
line=`wc -l <list.tmp`
if [ "$line" -ne 1 ]; then
read -p "File $ii :$file --- input store path:" fpath
if [ a"$fpath" = "a" ];then
echo 'no path input, shell terminated!'
exit 1
else
echo -e " ----File $ii :$files copied to $fpath  ---- \n"
cp -i $files  $fpath
unset fpath
let ii=ii+1
fi
else
file=`basename $files`
rep=`find $dir2 -type f -name $file`
cp -i $files $rep
echo -e " ----File $ii :$files copied to $rep  ---- \n"
let ii=ii+1
fi
done


echo "replace finished ok"
rm -f list.tmp
