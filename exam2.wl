task1[f_, s_,  a_,  b_, n_] := Module[{y, h, x},
   y = Table[s, n + 1];
   h = 1.0 / n;
   y[[2]] = s + h * f[a + h / 2.0, s + f[a, s] / 2];
   For[i = 2, i <= n, i++,
    x = a + i * h * b;
    y[[i + 1]] = 
     y[[i]] + 3 / 2 * h * f[x, y[[i]]] - h / 2 * f[x - h, y[[i - 1]] ];
    ];
   y
   ];
f[x_, y_] = 2 * y;
n = 100;
a = 0;
b = 3;
s = 1;
h = 1.0 / n;
y = task1[f, s, a, b, n];
ListPlot[Table[{a + i * h * b, y[[i + 1]]}, {i, 0, n}], 
 AspectRatio -> 1]
