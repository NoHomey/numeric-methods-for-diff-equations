h = 0.2;
f[x_] = Exp[X];
d = D[f[t], t];
p1 = Plot[{d[t], (f[t + h] - f[t]) / h}, {t, 0 , 10}];
p2 = Plot[{d[t], (f[t - h] - f[t]) / h}, {t, 0 , 10}];
p3 = Plot[{d[t], (f[t + h] - f[t - h]) /2 * h}, {t, 0 , 1}];
GraphsRow[{p1, p2, p3}];
g[x_] = x*Cos[x]*Sin[x];
g1[x_] = D[g[x], x];
g2[x_] = D[g1[x], x];
g3[x_] = D[g2[x], x];
g4[x_] = D[g3[x], x];
a = 5;
t2[x_ ] = g[x] + (x - a)*g1[x] + ((x - a)^2)/2*g2[x];
t3[x_] = t2[x] + ((x - a)^3)/6*g3[x];
t4[x_] = t3[x] + ((x - a)^4)/24*g4[x];
Plot[{g[x], t2[x], t3[x], t4[x]}, {x, -100, 100}]
