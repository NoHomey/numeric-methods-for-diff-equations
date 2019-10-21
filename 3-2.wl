s = 0.01;
r = 10;
n = 100;
h = 6/n;
y = Table[0, {n + 1}];
y[[1]] = s;
For[i = 1, i < n + 1, i++,
  a = y[[i]] + h*r*y[[i]]*(1 - y[[i]]);
  y[[i + 1]] = x /. FindRoot[ x == y[[i]] + h*r*x*(1 - x), {x, a }];];
z = Table[0, {n + 1}];
z[[1]] = s;
For[i = 1, i < n + 1, i++, 
  z[[i + 1]] = z[[i]] + h*r*z[[i]]*(1 - z[[i]]);];
p1 = ListPlot[Table[{i*h, z[[i + 1]]}, {i, 0, n}]];
p2 = ListPlot[Table[{i*h, y[[i + 1]]}, {i, 0, n}]];
u[x_] = (s*Exp[r*x])/(1 + s*(Exp[r*x] - 1));
p3 = Plot[u[x], {x, 0, 6}, PlotRange -> All];
Show[p1, p3]
Show[p2, p3]
