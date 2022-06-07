function x = Jacobi(A,b,x0,maxiter,tol)
% JACOBI method
% x = jacobi(A,b,x0,maxiter,tol) attempts to solve the system A*X = B with 
% the JACOBI method. x0 is the initial guess, maxiter is the maximum number
% of iterations, and tol is the specified tolerance on the error
% Author: Arshad Afzal, Assistant Professor, GIST, South Korea
% For Education purpose only
[m,n]=size(A);
x = x0;                 % Initialize the solution vector,x
iter = 1;               % Start the iteration counter
ShowIterInfo = true;    % Flag for Showing Iteration Informatin 
error = zeros(maxiter, 1);
% Main Loop
while (iter <= maxiter)
    sum = zeros(m,1);
    for i=1:m
        for j=1:n
            sum(i) = sum(i)+(-A(i,j)*x(j));
        end
    end
    
% Update the solution vector, 'x'
    for k=1:m
        x(k)=(1/A(k,k))*(sum(k)+b(k))+x(k);
    end
    
error(iter) = norm(x-x0); % ||x(i+1)-x(i)||
    
% Display Iteration Information
    if ShowIterInfo
        disp(['Iteration ' num2str(iter) ': error = ' num2str(error(iter))]);
    end        
% Checking the maximum relativ errror at each Iteration
if (error (iter) < tol)
    fprintf('\n Algorithm stopped: error value less than specified tolerance \n');
    break;
 end
 
 if (iter == maxiter)
    fprintf('\n Algorithm stopped: maximum number of iteartions reached \n')  
    break;
 end
 
 x0 = x;
iter = iter+1;
end
end
