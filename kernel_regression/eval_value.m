function pred = eval_value(x, X, f, f_param, a)
    [n,~] = size(X); %extragem numarul de date
    pred = 0; %initializam valoarea predictiei
    for i = 1:n %parcurgem fiecare punct din setul de date
        kernel_value = f(x, X(i, :), f_param); %calculam valoarea kernel-ului
        pred = pred + a(i) * kernel_value; %calculam valoarea predictiei
    endfor
endfunction
