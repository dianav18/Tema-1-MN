function B = k_secv(A, k)
    B = cell(0,1);
    %numarul de secvente de k cuvinte, fara ultima
    num_of_sequences = length(A) - k;

    for i = 1:num_of_sequences
        B{end+1, 1} = strjoin(A(i:i+k-1), ' '); %extragem secventa de k cuvinte si o adaugam in B
    endfor
endfunction
