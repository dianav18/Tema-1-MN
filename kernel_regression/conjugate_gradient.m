function [x] = conjugate_gradient(A, b, x0, tol, max_iter)
    % This function implements the Conjugate Gradient method for solving the
    % linear system Ax = b. It is assumed that A is symmetric and positive definite.
    % Inputs:
    %   A        - Coefficient matrix (symmetric and positive definite)
    %   b        - Resultant column vector
    %   x0       - Initial guess of the solution
    %   tol      - Tolerance for the solution's accuracy
    %   max_iter - Maximum number of iterations
    
    % Initialize variables
    x = x0;                     % Initial guess
    r = b - A * x;              % Initial residual
    p = r;                      % Initial search direction
    rsold = r' * r;             % The norm of the residual
    
    % Iterate up to max_iter times
    for i = 1:max_iter
        Ap = A * p;
        alpha = rsold / (p' * Ap);  % Step size
        x = x + alpha * p;          % Update solution estimate
        r = r - alpha * Ap;         % Update residual
        
        % Check if the solution is within the specified tolerance
        rsnew = r' * r;
        if sqrt(rsnew) < tol
            break;
        end
        
        % Update the search direction
        beta = rsnew / rsold;
        p = r + beta * p;
        
        rsold = rsnew;  % Update the norm of the residual for the next iteration
    end
    
    % Display warning if the maximum number of iterations is reached
    if i == max_iter
        disp('Maximum iterations reached without converging to the desired tolerance.');
    end
end
