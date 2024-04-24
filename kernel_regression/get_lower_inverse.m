function P = get_lower_inverse(L)
    % This function inverts a lower triangular matrix L using a Gaussian elimination method.

    n = size(L, 1);   % The size of the square matrix L
    P = eye(n);       % Initialize P as the identity matrix, which will be modified to the inverse of L

    % Solve L * P = I column by column
    for j = 1:n
        for i = j:n
            if i == j
                % Diagonal elements
                P(i, j) = 1 / L(i, i);
            else
                % Sub-diagonal elements, calculate using the formula below
                sum = 0;
                for k = j:i-1
                    sum = sum + L(i, k) * P(k, j);
                end
                P(i, j) = -sum / L(i, i);
            end
        end
    end
end
