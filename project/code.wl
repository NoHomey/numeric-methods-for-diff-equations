tridiagonal[n_, a_, b_, c_, d_] := Module[{p, q, x},
       p = Table[0.0, n - 1];
       q = Table[0.0, n ];
       x = Table[0.0, n ];
       p[[1]] = c[[1]] / b[[1]];
       For[i = 2, i <= n - 1, ++i,  
            p[[i]] = c[[i]] / (b[[i]] - a[[i - 1]] * p[[i - 1]]);];
       q[[1]] = d[[1]] / b[[1]];
       For[i = 2, i <= n , ++i,  
            q[[i]]
               = (d[[i]] - a[[i - 1]] * q[[i - 1]])
                /
                (b[[i]] - a[[i - 1]] * p[[i - 1]]);];
       x[[n]] = q[[n]];
       For[i = n - 1, i >= 1 , --i,  
            x[[i]] = q[[i]] - p[[i]] * x[[i + 1]];];
       x
   ];

approximate[n_] := Module[{h, a, b, c, d, h2, x, x2},
       h = 1.0 / n;
       a = Table[1.0, n];
       b = Table[1.0, n + 1];
       c = Table[1.0, n];
       d = Table[0.0, n + 1];
       c[[1]] = 0;
       h2 = h * h;
       For[i = 2, i <= n, ++i,
            x = 1 + (i - 1.0) * h; 
            x2 = x * x;
            b[[i]] = -(2.0 + h2 * x2);
            d[[i]] = h2 * (x2 * Log[x] + 1.0 / x2);
        ];
       b[[n + 1]] = -(1.0 + 2.0 * h2);
       d[[n + 1]] = h2 * (Log[4.0] + 1.0 / 8.0) - h / 2.0;
       tridiagonal[n + 1, a, b, c, d]
   ];

n = 1000;
yn = approximate[n];
y2n = approximate[2 * n];
y4n = approximate[4 * n];
x = Table[1.0 + i / n, {i, 0, n}];
ListPlot[Table[{x[[i]], yn[[i]]}, {i, 1, n + 1}], PlotRange -> All]
a = Table[
   Log[Abs[(yn[[i + 1]] - y2n[[2 * i + 1]]) / 
       If[i == 0,   0.0000001, 
        y2n[[2 * i + 1]] - y4n[[4 * i + 1]]]]] / Log[2], {i, 0, n }];
Grid[Transpose[{x, yn, a}], Frame -> All]
