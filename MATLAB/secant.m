function [root,ea,iter]=secant(func,first,next,es,maxit)
iter = 0; ea = 100; old=0;
while (1)
old=next;
next=next-(func(next)*(first-next)/(func(first)-func(next)));
ea = abs((func(next) - func(first))/func(next)) * 100;
first=old;
fprintf('%d\n',next)
iter = iter + 1;
if ea <= es || iter >= maxit, break, end
end
root = next;