function [a] = get_prediction_params_iterative(K, y, lambda)
    % This function estimates the evaluation parameters used in a kernel-based
    % regression model. It receives a kernel matrix K, the evaluated values y for
    % the inputs on which K was built, and a regularization parameter lambda. The
    % function returns the column vector a containing the parameter estimates,
    % using the conjugate gradient method for solving the regularized system.

    % Size of the kernel matrix
    n = size(K, 1);

    % Form the regularized kernel matrix
    A = K + lambda * eye(n);

    % Initial guess for the parameter vector
    x0 = zeros(n, 1);  % You could also use random initializations or other heuristics

    % Tolerance and maximum iterations for the conjugate gradient method
    tol = 1e-6;        % Adjust tolerance as needed for your application
    max_iter = 1000;   % Maximum number of iterations

    % Call a conjugate gradient solver to solve Ax = y
    a = conjugate_gradient(A, y, x0, tol, max_iter);
end

function [x] = conjugate_gradient(A, b, x0, tol, max_iter)
    % Conjugate Gradient Solver Function
    % Solves Ax = b for x, where A is positive definite and symmetric

    x = x0;
    r = b - A * x;
    p = r;
    rsold = r' * r;

    for i = 1:max_iter
        Ap = A * p;
        alpha = rsold / (p' * Ap);
        x = x + alpha * p;
        r = r - alpha * Ap;
        rsnew = r' * r;
        if sqrt(rsnew) < tol
            break;
        end
        beta = rsnew / rsold;
        p = r + beta * p;
        rsold = rsnew;
    end

    if i == max_iter
        disp('Maximum iterations reached without converging to the desired tolerance.');
    end
end
