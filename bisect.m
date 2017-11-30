function [root,fx,ea,iter]  = bisect(func,xl,xu,es,maxit,varargin)
%bisect:root location 
%[root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,p1,p2,...):
% use bisection method to find the root of func

%input:
% func = name of function
% xl,xu = lower,upper guesses
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,.... = additional parameters used by func

%ourput:
% root = real root
% fx = function value at root
% ea = approximate relative error
% iter = number of iteration
% exampe:
%>>fm=@(m) sqrt(9.81*m/0.25)*tanh(sqrt(9.81*0.25/m)*4)-36;
%>>[mass fx ea iter]=bisect(fm,40,200)
if nargin<3
    error('at least 3 input arguments required')
end
test = func(xl,varargin{:}) * func(xu,varargin{:});
if test>0, error('no sign change'),end
if nargin<4|isempty(es),es=0.0001;end
if nargin<5|isempty(maxit),maxit=50;end

% initialization
iter = 0;
xr = xl;
ea = 100;

while(1)
    xrold = xr;
    xr = (xl+xu)/2
    iter = iter+1;
    if xr~=0, ea = abs((xr-xrold)/xr)*100;end
    test = func(xl,varargin{:}) * func(xr,varargin{:});
    if test<0
        xu = xr;
    elseif test>0
        xl = xr;
    else
        ea=0;
    end
    
    if ea<=es|iter>=maxit,break,end
end
root = xr;
fx=func(xr,varargin{:});
    