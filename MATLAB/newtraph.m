function [root, ea, iter] = newtraph(func, xr, es, maxiter)
    
if ( nargin < 2 )
    error('at least 2 input arguments required');
end

if ( nargin < 3 )
    es = 1.0;
end

if ( nargin < 4 )
    maxiter = 10;
end

iter = 0;
dx = 0.00001;

dfunc = (subs(func, xr+dx) - subs(func, xr)) / dx;
fprintf('iter = %d: xr = %.4f\n', iter, xr);

while (1)
    xrold = xr;
    xr = xr - (subs(func,xr) / subs(dfunc, xr));
    
    ea = abs((xr - xrold) / xr) * 100;
    iter = iter + 1;

    fprintf('iter = %d: xr = %.4f, ea = %.4f\n', iter, xr, ea);
    
     if (ea <= es) || (iter >= maxiter)
        break;
     end 
end

root = xr;