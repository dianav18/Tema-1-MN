function probs = sample_next_word(text, words_idx, k_secv_idx, k, stoch)
    k_sequence = text(end-k+1:end); %extragem ultima secventa de k cuvinte
    if isKey(k_secv_idx, k_sequence) %verificam daca exista secventa in setul de date
        k_secv_index = k_secv_idx(k_sequence);
        probs = stoch(k_secv_index, :);
    endif
endfunction
