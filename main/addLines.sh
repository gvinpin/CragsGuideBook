#!/bin/bash

cd processing
find *.sh -exec chmod +x {} \;
find *.sh -exec ./{} \;
cd ..
a=`find . -type d -name routelist`
echo $a

find  $a -name '*' -exec ./create_table.sh {} \;
cp $a/*.tex ./processing
b=`find .  -type d  -name topos`
find $b -exec ./tex.sh {} \;
cd processing
find -name '*.sh' -exec rm {} \;
find . -name "*.tex" -exec  sed -ie  "s/&#39;//g" {} \;



 find  *.jpg -exec convert  {}  {}.eps \;
 find  *.png -exec convert  {}  {}.eps \;
 rename 's/.jpg//gi' *.*
 rename 's/.png//gi' *.*
 cd ..
