#! /bin/bash 
# latex2pdf version 1.01 2009/08/31
#
# Example bash script making smaller PDF files 
# from LaTeX using dvips option of package curves.  
# e.g. Download file, make executable and run 
# $ ./latex2pdf curves.dtx

latex $1
set -e
bn=${1%%.*}
dvips $bn
ps2pdf $bn.ps
rm $bn.dvi $bn.ps
