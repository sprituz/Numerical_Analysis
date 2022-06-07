function [x,iter] = Gauss_Seidel(A,b,x0,es,maxit)
if nargin<4, maxit=500; end
if nargin<3, es=0.00001; end
[m,n] = size(A);
if m ~= n, error('Matrix A must be square'); end
x=x0;
C = A;
for i = 1:n
    C(i,i) = 0;
end
x = x';
for i = 1:n
    C(i,1:n) = C(i,1:n)/A(i,i);
end
for i = 1:n
    d(i) = b(i)/ A(i,i);
end
iter = 0;
while (1)
    xold = x; 

for i = 1:n
    x(i) = d(i) - C(i,:)*x;
    if x(i) ~= 0
        ea(i) = abs((x(i) - xold(i))/x(i)) * 100
    end
end
iter = iter +1;
if max(ea)<=es || iter >= maxit, break, end
end 