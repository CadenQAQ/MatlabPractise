function yend = odesimp(dydt, dt, ti, tf, yi) 
t = ti; y = yi; h = dt;
while (1)
if t + dt > tf, h = tf - t; 
end
y = y + dydt(y) * h;
t = t + h;
if t >= tf, break, end
end
yend = y;
% example
% >> dvdt=@(v) 9.81-(0.25/68.1)*v*abs(v); 
% >> odesimp(dvdt,0.5,0,12,0)
