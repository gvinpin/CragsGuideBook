/topobox/{

s/.*huge/ \\end{enumerate} \\end{figure}  \\begin{figure}[h] \\center{\\includegraphics[width=1\\linewidth] {huge/;
s/jpg.*/eps} }  \\begin{enumerate} /; p

}
/topo-routes-container/{
n;

/miniheader/{

a\ \\caption{
n; p;
#p;
a\};
n; }
}

/route-name/{
a\ \\item
n;
n;p
}

/route-info/{
s/.*'>//;
s/<\/div>//;
p;

};
