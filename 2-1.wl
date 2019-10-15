f[x_] = x*Sin[x]*Cos[x];
a = 5;
err = 100;
i = 3;
xmin = 0;
xmax = 10;
step = 0.2;
r = Range[xmin, xmax, step];
g[x_] = Normal[Series[f[x], {x, a, i}]];
While[err > 0.01,
 g[x_] = Normal[Series[f[x], {x, a, i}]];
 h[x_] = Abs[f[x] - g[x]];
 err = Max[Map[h, r]];
 i++;]
i
Plot[{f[x], g[x]}, {x, xmin, xmax}]
