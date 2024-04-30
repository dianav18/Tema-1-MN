function [a] = get_prediction_params(K, y, lambda)

    % Calculam dimensiunea matricei K
    [n, ~] = size(K);

    % Adaugam termenul de regularizare pe diagonala principala a matricei K
    regularization = K + lambda * eye(n);

    %L matrice inferior triunghiulara
    L = cholesky(regularization);

    z = L \ y;

    a = L' \ z;
endfunction
