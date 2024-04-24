function [a] = get_prediction_params(K, y, lambda)
    % Functia primeste ca parametri matricea de kernel K, valorile evaluate y
    % pentru inputurile pe care a fost construit K si parametrul lambda folosit
    % pentru regularizare si trebuie sa intoarca vectorul coloana a ce contine 
    % estimari ai parametrilor folositi la evaluare (folositi metoda Cholesky personalizata).

    % Calculam dimensiunea matricei K
    n = size(K, 1);

    % Adaugam termenul de regularizare pe diagonala principala a matricei K
    K_reg = K + lambda * eye(n);

    % Efectuam descompunerea Cholesky a matricei regularizate folosind functia cholesky customizata
    % L este o matrice triangulara inferioara
    L = cholesky(K_reg);

    % Rezolvam primul sistem triangular: L * z = y
    z = L \ y;

    % Rezolvam al doilea sistem triangular: L' * a = z
    a = L' \ z;
end
