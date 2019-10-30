s = 1;
n = 200;
b = 4;
h = b/n;
u[x_] = If[x > 2, 
   x / 3 - 1 / 9 + Exp[-3 * x] * (4/9  * Exp[6] + 2 * Exp[4]), 
   x - 1 + 2 * Exp[-x]];
a[x_] = If[x > 2, 3, 1];
f[x_, y_] = -a[x] * y + x; 
y = Table[0, {n + 1}];
y[[1]] = s;
e = Table[0, {n + 1}];
e[[1]] = Abs[u[0] - s];
err = e[[1]];
For[i = 1, i < n + 1, i++, t = y[[i]];
  x = i * h; 
  k1 = h * f[x, t];
  k2 = h * f[x + h / 2, t + k1 / 2];
  k3 = h * f[x + h /2, t + k2 / 2];
  k4 = h * f[x + h, t + k3];
  y[[i + 1]] = t + (k1/6) + (k2/3) + (k3/3) + (k4/6);
  e[[i + 1]] = Abs[u[x] - y[[i + 1]]];
  err = Max[err, e[[i + 1]]];];
p1 = ListPlot[Table[{i*h, y[[i + 1]]}, {i, 0, n}], AspectRatio -> 1];
p2 = Plot[u[x], {x, 0, b}, PlotRange -> All, AspectRatio -> 1];
p3 = ListPlot[Table[{i*h, e[[i + 1]]}, {i, 0, n}], AspectRatio -> 1];
N[err]
Show[p1, p2, AspectRatio -> 1]
p3
