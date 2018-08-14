#!/bin/bash

#download all files
cat $1 |  grep "topobox"  | sed "s/.*https/https/g; s/jpg.*/jpg /g; s/png.*/png /g" > filelist.txt
wget -i filelist.txt
rm filelist.txt


if ! [ -d processing ]; then
    mkdir processing
fi

mv *.jpg ./processing/
mv *.png ./processing/


# create script for painting  lines

echo "#!/bin/bash" > $1.print_lines.sh
 cat $1 | sed -nf create_lines_sed.sed | awk '/huge/ {line=$4} /  \"/ {$0 = $0 line} 1' >> $1.print_lines.sh
 chmod +x  $1.print_lines.sh

 sed -i $1.print_lines.sh -e "/red/{n;s/red/yellow/;n; s/red/blue/;n;s/red/green/}"

# # create script for text

 cp  $1.print_lines.sh   $1.print_text_tmp.sh

 sed -i  $1.print_text_tmp.sh -e " /conv/! { s/huge/\n huge/}"
 sed -i  $1.print_text_tmp.sh -e "s/stroke/fill/g;s/polyline/text/g"

 cat $1.print_text_tmp.sh \
     | awk '/convert/{LOCAL_COUNTER=1;} ;/draw/{ a=  $1 " "  $2 " " $3  " "$4 " " $5 "  MARKER1" LOCAL_COUNTER "MARKER2"  "\" \\" ; LOCAL_COUNTER=LOCAL_COUNTER+1 ; print a}; /huge/{print $0} ' | sed "s/MARKER1/\'/g ; s/MARKER2/\'/g" \
     | sed -e "s/convert/ \n convert  -pointsize 20 -stroke black /g" > $1.print_text.sh

 rm $1.print_text_tmp.sh
 mv $1.print_text.sh ./processing/
 mv $1.print_lines.sh ./processing/
 
 find . -name *.html -exec rm {} \;

#source processing/$1.print_lines.sh # drawing all lines
# bash  script/$1.print_text.sh


 # cd processing

 # find  *.jpg -exec convert  {}  {}.eps \;
 # find  *.png -exec convert  {}  {}.eps \;
 # rename 's/.jpg//gi' *.*
 # rename 's/.png//gi' *.*

 # cd ..


# find  *.jpg -exec convert  {}  {}.eps \;
# find  *.png -exec convert  {}  {}.eps \;
