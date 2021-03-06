h = 0.01;
T = 0.1;
t = h^2/3;
n = Floor[1/h] + 1
m = (Floor[T/ t] + 1)
y = Table[0.0, {m + 1}, {n + 1}];
v[x_] = If[x > 0.1, 0, 100];
For[i = 0, i <= n, ++i, y[[1, i + 1]] = N[0];];
For[j = 0, j <= m, ++j, y[[j + 1, n + 1]] = N[0];];
g = N[t/h^2]
For[j = 1, j <= m, ++j,
  For[i = n, i > 1, --i,
   y[[j + 1, i]] =
     N[g*y[[j, i + 1]] + (1 - 2*g)*y[[j, i]] + g*y[[j, i - 1]] +
       t*(N[v[i*h]] - y[[j, i]])];];
  y[[j + 1, 1]] = (1 - t - 2*g)*y[[j, 1]] + 2*g*y[[j, 2]] + 100*t;];
Manipulate[
 ListPlot[Table[{i/n, y[[j + 1, i + 1]]}, {i, 0, n}],
  PlotRange -> All, PlotStyle -> Green], {j, 0, m}]
