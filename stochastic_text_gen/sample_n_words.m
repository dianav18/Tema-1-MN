function retval = sample_n_words(text, widx, kscvidx, k, stoch, word_set, n)
    % Verificăm dacă textul are lungimea minimă necesară
    if numel(text) < k
        error('Textul trebuie să aibă cel puțin lungimea k.');
    end
    
    % Inițializăm variabila de ieșire cu textul existent
    retval = text;
    
    % Iterăm pentru a genera n cuvinte noi
    for i = 1:n
        % Extragem ultimele k cuvinte din text (k-secvența)
        k_seq = text(end - k + 1:end);
        
        % Verificăm dacă k-secvența se află în word_set
        if isfield(kscvidx, k_seq)
            next_word_candidates = kscvidx.(k_seq);
        else
            % Dacă k-secvența nu este găsită, utilizăm o abordare stocastică
            next_word_candidates = stoch;
        end
        
        % Selectăm un cuvânt următor din candidații disponibili
        next_word_idx = randsample(next_word_candidates, 1);
        next_word = widx{next_word_idx};
        
        % Adăugăm cuvântul selectat la textul rezultat
        retval = [retval ' ' next_word];
        
        % Actualizăm k-secvența pentru următoarea iterare
        text = [text ' ' next_word];
    end
end
