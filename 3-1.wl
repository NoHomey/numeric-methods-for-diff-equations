s = 0.01;
r = 10;
n = 100;
h = 1/n;
y = Table[0, {n + 1}];
y[[1]] = s;
For[i = 1, i < n + 1, i++,
  a = y[[i]] + h*r*y[[i]]*(1 - y[[i]]);
  y[[i + 1]] = x /. FindRoot[ x == y[[i]] + h*r*x*(1 - x), {x, a }];];
p1 = ListPlot[Table[{i*h, y[[i + 1]]}, {i, 0, n}]];
u[x_] = (s*Exp[r*x])/(1 + s*(Exp[r*x] - 1));
p2 = Plot[u[x], {x, 0, 1}, PlotRange -> All];
Show[p1, p2]
