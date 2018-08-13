#!/usr/bin/sed

/class=\"topobox/{
s/.*huge/convert  -fill none huge/g;
x;p;x;
s/\"lines\":/\n -draw \"stroke red  polyline  /g;
s/\]\],\[\[/ \" \\\n -draw \"stroke red  polyline  /g;
s/\],\[/  /g;s/\]/ /g;
s/\[/ /g;
s/}<\/script/ \" \n /g;
s/<div.*/ \n /g;
s/jpg.*{/jpg \\/g;
s/jpg.*{/jpg \\/g;
s/png.*{/png \\/g;
s/>/ /g;
p
};

#s/.*huge/huge/g;
#/<li class=\"route\"/{
#:s ;
#/orderno/{s/<div class=\"orderno\">//; s/<\/div>//; p};
#/route-info/p;
#/<a /{n;p}
#n;
#s/\n//g;#
#
#/<\/li>/! bs;
#};
