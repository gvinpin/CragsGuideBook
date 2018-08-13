#!/bin/bash



echo "\begin{longtable}{llll}" > $1_table.tex


cat $1 | sed -nf create_topos_table.sed  >> $1_table.tex
echo "\end{longtable}" >> $1_table.tex
