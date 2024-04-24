function probs = sample_next_word(text, words_idx, k_secv_idx, k, stoch)
    % Verifică dacă textul are cel puțin k caractere
    if numel(text) < k
        error('Textul trebuie să conțină cel puțin k caractere.');
    end
    
    % Extrage ultima k-secvență din text
    last_k_seq = text(end-k+1:end);
    
    % Verifică dacă k-secvența este prezentă în dicționarul k_secv_idx
    if isKey(k_secv_idx, last_k_seq)
        % Obține indexul k-secvenței
        k_secv_index = k_secv_idx(last_k_seq);
        
        % Obține linia corespunzătoare din matricea stochastică
        probs = stoch(k_secv_index, :);
    else
        error('Ultima k-secvență din text nu este prezentă în dicționarul k_secv_idx.');
    end
end
