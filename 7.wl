h = 0.01;
t = h^2 / 3;
n = Floor[1/h] + 1
m = Floor[1/t] + 1
y = Table[0.0, {m + 1}, {n + 1}] ;
For[i = 0, i <= n, ++i,
  y[[1, i + 1]] = N[Sin[2.0 * Pi* i / n]]];
For[j = 0, j <= m, ++j,
  y[[j + 1, 1]] = N[0];
  y[[j + 1,  n + 1]] = N[0];
  ];
c = n^2/m;
For[j = 1, j < m, ++j,
  For[i = 1, i < n, ++i,
    y[[j + 1,  i + 1]] = 
     c * (y[[j, i + 2]] + y[[j, i ]] -  2 * y[[j, i + 1]]) + 
      y[[j, i + 1]]
    ];
  ];
p1 = ListPlot[Table[{i / n, y[[3, i + 1]]}, {i, 0, n}], 
   PlotRange -> All ];
p2 = ListPlot[Table[{i / n, y[[m - 1, i + 1]]}, {i, 0, n}], 
   PlotRange -> All];
Show[p1, p2]
