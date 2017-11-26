function favg = funcavg(f,a,b,n)
% funcavg: average function height
% favg=funcavg(f,a,b,n): compute average value of function over a range
% input: f = function to be evaluated
%        a = lower bound of range
%        b = upper bound of range
%        n = number of intervals
% output:
%  favg = average value of function

% command window example:
% vel=@(t) sqrt(9.81*68.1/0.25)*tanh(sqrt(9.81*0.25/68.1)*t);
% funcavg(vel,0,12,60)

x=linspace(a,b,n);
y=f(x);
favg=mean(y); 



