function [xopt,fopt] = prob0713(func, xlow, xhigh, es, maxit, varargin)

if nargin < 3, error('err'),end
if nargin < 4 || isempty(es), es = 0.0001; end
if nargin < 5 || isempty(maxit),maxit = 50; end

iter = 0;
x1 = xlow;
x3 = xhigh;
x2 = (x1 + x3)/2;
f1 = func(x1,varargin{:});
f2 = func(x2,varargin{:});
f3 = func(x3,varargin{:});

if f2>f1 && f2<f3
    xopt_old = x2;
    while(1)
       xopt = x2-0.5*((x2-x1).^2*(f2-f3)-(x2-x3).^2*(f2-f1))/((x2-x1)*(f2-f3)-(x2-x3)*(f2-f1));
       fopt = func(xopt,varargin{:});
        iter = iter + 1;

        if xopt > x2
            x1 = x2;
            f1 = f2;
            x2 = xopt;
            f2 = fopt;

        else
            x3 = x2;
            f3 = f2;
            x2 = xopt;
            f2 = fopt;
        end

       if xopt ~= 0, ea=abs(xopt - xopt_old) * 100; end
            xopt_old = xopt;
        if ea<=es || iter>=maxit, break, end
    end
end
