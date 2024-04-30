function [K] = build_kernel (X, f, f_param)

  n = size(X, 1); %extragem numarul de date
  K = zeros(n, n); %initializam matricea kernel
  for i = 1:n 
    for j = 1:n
      K(i, j) = feval(f, X(i, :), X(j, :), f_param); %calculam valoarea kernel-ului
    endfor
  endfor

endfunction
