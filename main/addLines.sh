#!/bin/bash

cd processing
find *.sh -exec chmod +x {} \;
find *.sh -exec ./{} \;
rm *.sh
cd ..
a=`find . -type d -name routelist`
echo $a

find  $a -name '*' -exec ./create_table.sh {} \;
cp $a/*.tex ./processing
b=`find .  -type d  -name topos`
find $b -exec ./tex.sh {} \;
cd processing
find -name '*.sh' -exec rm {} \;
find . -name "*.tex" -exec  sed -i  "s/&#39;//g" {} \;
rm *.texe
find . -name "*.tex" -exec  sed -i  "s/enumerate}/enumerate_my}/g" {} \;
rm *.texe
rm *.tex.tex
find . -name "*.tex" -exec   sed -i "/MARKER1/{s/MARKER1//g;n;s/\\\end{enumerate_my} \\\end{figure}//g;}" {} \;

rm *.texe
find . -name "*.tex" -exec   sed -i "s/};/}/g" {} \;
 find  *.jpg -exec convert  {}  {}.eps \;
 find  *.png -exec convert  {}  {}.eps \;
 rename 's/.jpg//gi' *.*
 rename 's/.png//gi' *.*
 cd ..
