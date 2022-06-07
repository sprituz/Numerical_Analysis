function [x,fx,ea,iter]=goldmin(f,xl,xu,es,maxit) 
R=(sqrt(5)-1)/2; iter=0;
while(1)
d = R * (xu - xl) 
x1 = xl + d
x2 = xu - d
f(x2)
f(x1)
if f(x1) > f(x2)
xopt = x1; xl = x2; 
else
xopt = x2; xu = x1; 
end
iter=iter+1;
if xopt~=0, ea = (1 - R) * abs((xu - xl) / xopt) * 100;
end 
if ea <= es || iter >= maxit,break,end
end
x=xopt;
fx=f(xopt); 
fprintf('iter = %d: xl = %.4f xu = %.4f, ea = %.4f\n', iter, xl,xu, ea);
end