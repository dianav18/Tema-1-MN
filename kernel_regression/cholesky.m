function L = cholesky(A)
    % Input: A - Symmetric, positive-definite matrix
    % Output: L - Lower triangular matrix such that A = LL'
    
    n = size(A, 1);
    L = zeros(n); % Initialize L as a zero matrix of the same size as A
    
    for i = 1:n
        for j = 1:i-1
            % Compute off-diagonal elements using vectorized dot product
            L(i, j) = (A(i, j) - L(i, 1:j-1) * L(j, 1:j-1)') / L(j, j);
        end
        % Compute diagonal elements using vectorized norm calculation
        L(i, i) = sqrt(A(i, i) - sum(L(i, 1:i-1).^2));
    end
end
