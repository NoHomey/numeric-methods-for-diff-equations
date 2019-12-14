tridiagonal[n_, a_, b_, c_, d_] := Module[{p, q, x},
   p = Table[0.0, n - 1];
   q = Table[0.0, n ];
   x = Table[0.0, n ];
   p[[1]] = c[[1]] / b[[1]];
   For[i = 2, i <= n - 1, ++i,  
    p[[i]] = c[[i]] / (b[[i]] - a[[i - 1]] * p[[i - 1]]);];
   q[[1]] = d[[1]] / b[[1]];
   For[i = 2, i <= n , ++i,  
    q[[i]] = (d[[i]] - a[[i - 1]] * q[[i - 1]]) / (b[[i]] -
         a[[i - 1]] * p[[i - 1]]);];
   x[[n]] = q[[n]];
   For[i = n - 1, i >= 1 , --i,  
    x[[i]] = q[[i]] - p[[i]] * x[[i + 1]];];
   x
   ];
n = 4;
a = {2.0, 2.0, 2.0};
b = {1.0, 1.0, 1.0, 1.0};
c = {-1.0, -1.0, -1.0};
d = {1.0, 1.0, 1.0, 2.0};
tridiagonal[n, a, b, c, d]