s = 0.01;
r = 10;
n = 80;
b = 3;
h = b/n;
u[x_] = (s*Exp[r*x])/(1 + s*(Exp[r*x] - 1));
y = Table[0, {n + 1}];
y[[1]] = s;
e = Table[0, {n + 1}];
e[[1]] = Abs[u[0] - s];
err = e[[1]];
For[i = 1, i < n + 1, i++,
  t = y[[i]];
  k1 = h * 10 * t * ( 1 - t);
  k2 = h * 10 * (t + k1/2)*(1 - t - k1/2);
  k3  = h * 10 * (t + k2/2)*(1 - t - k2/2);
  k4 = h * 10 * (t + k3) * ( 1 - t - k3);
  y[[i + 1]] = t + (k1/6) + (k2 / 3) + (k3/ 3) + (k4 / 6);
  e[[i + 1]] = Abs[u[i * h] - y[[i + 1]]];
  err = Max[err, e[[i + 1]]];
  ];
p1 = ListPlot[Table[{i*h, y[[i + 1]]}, {i, 0, n}]];
p2 = Plot[u[x], {x, 0, b}, PlotRange -> All];
p3 = ListPlot[Table[{i*h, e[[i + 1]]}, {i, 0, n}]];
err
Show[p1, p2]
p3
