#!/bin/bash


#cat template_latex.tex > $1.tex
#echo "\fancyhead[C]{" > $1.tex

#cat $1 | grep    "sector-property copytoclipboard" | awk '/sector/{print $4; print $5}' | sed "s/.*=//g" >> $1.tex
#grep "sector-coordinates copy"
#echo "}" >> $1.tex

#echo "chapter $1 ">> $1.tex

#echo "ffff">__gide.tex
cat $1 | sed -nf create_tex.sed >> $1.tex
echo " \end{enumerate} \end{figure}  " >> $1.tex

#\end{document}
#cat __gide.tex
