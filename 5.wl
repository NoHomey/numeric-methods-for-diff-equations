s = 1;
n = 200;
b = 4;
h = b/n;
eps = 0.00001;
u[x_] = If[x > 2, x/3 - 1/9 + Exp[-3*x]*(4/9*Exp[6] + 2*Exp[4]), 
   x - 1 + 2*Exp[-x]];
a[x_] = If[x > 2, 3, 1];
f[x_, y_] = -a[x]*y + x;
y = Table[0, {n + 1}];
y[[1]] = s;
e = Table[0, {n + 1}];
eCor = Table[0, {n + 1}];
e[[1]] = Abs[u[0] - s];
eCor[[1]] = e[[1]];
err = eCor[[1]];
For[i = 1, i < 4, i++,
  t = y[[i]];
  x = i*h;
  k1 = h*f[x, t];
  k2 = h*f[x + h/2, t + k1/2];
  k3 = h*f[x + h/2, t + k2/2];
  k4 = h*f[x + h, t + k3];
  y[[i + 1]] = t + (k1/6) + (k2/3) + (k3/3) + (k4/6);
  e[[i + 1]] = Abs[u[x] - y[[i + 1]]];
  eCor[[i + 1]] = e[[i + 1]];
  err = Max[err, eCor[[i + 1]]];];
fImin3 = f[0, y[[1]]];
fImin2 = f[h, y[[2]]];
fImin1 = f[2*h, y[[3]]];
xI = 3*h;
yI = y[[4]];
fI = f[xI, yI];
For[i = 4, i < n + 1, i++ ,
  t = yI + (h/24)*(55*fI - 59*fImin1 + 37*fImin2 - 9*fImin3);
  tmp = t;
  Do[
   next = yI + (h/24)*(9*f[xI, t] + 19*fI - 5*fImin1 + fImin2);
   old = tmp;
   tmp = next;
   If[Abs[old - next] < eps, Break[]], 4];
  y[[i + 1]] = tmp;
  e[[i + 1]] = Abs[u[x] - t];
  eCor[[i + 1]] = Abs[u[x] - tmp];
  err = Max[err, eCor[[i + 1]]];
  fImin3 = fImin2;
  fImin2 = fImin1;
  fImin1 = fI;
  xI += h;
  yI = t;
  fI = f[xI, yI];];
p1 = ListPlot[Table[{i*h, y[[i + 1]]}, {i, 0, n}], AspectRatio -> 1];
p2 = Plot[u[x], {x, 0, b}, PlotRange -> All, AspectRatio -> 1, 
   PlotStyle -> Red];
p3 = ListPlot[Table[{i*h, e[[i + 1]]}, {i, 0, n}], AspectRatio -> 1, 
   PlotStyle -> Green];
p4 = ListPlot[Table[{i*h, eCor[[i + 1]]}, {i, 0, n}], 
   AspectRatio -> 1, PlotStyle -> Red];
N[err]
Show[p1, p2, AspectRatio -> 1]
Show[p3, p4, AspectRatio -> 1]
dif[x_, y_] = N[Abs[N[x] - N[y]]];
Max[Map[Abs, MapThread[dif, {e, eCor}]]]
