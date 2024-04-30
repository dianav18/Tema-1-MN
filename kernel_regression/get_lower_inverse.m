function P = get_lower_inverse(L)
    % Calculeaza inversa matricei inferior triunghiulare prin eliminare Gaussiana
    % L - matricea inferior triunghiulara
    % P - inversa matricei L
    [n, ~] = size(L);
    P = eye(n);    

    for j = 1:n
        for i = j:n
            if i == j
                P(i, j) = 1 / L(i, i);
            else
                sum = 0;
                for k = j:i-1
                    sum = sum + L(i, k) * P(k, j);
                end
                P(i, j) = -sum / L(i, i);
            endif
        endfor
    endfor
endfunction
