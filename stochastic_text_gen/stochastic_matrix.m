function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_set, k_secv_set, k)
    [in_k_secv_set, k_secv_idx] = ismember(k_secv_corpus, k_secv_set); % in_k_secv_set = 1 daca k_secv_corpus[i] e in k_secv_set, 0 altfel
    [in_words_set, words_idx] = ismember(corpus_words, words_set); % in_words_set = 1 daca corpus_words[i] e in words_set, 0 altfel

    matrix = zeros(length(corpus_words) - k, length(words_set));  %initializam matricea cu 0

    for i = 1:length(corpus_words) - k %parcurgem cuvintele din corpus
        if in_k_secv_set(i) && in_words_set(i + k) %daca secventa de k cuvinte si cuvantul de pe pozitia i+k exista in seturile de date
            sequence_index = k_secv_idx(i); %extragem indexul secventei
            word_index = words_idx(i + k); %extragem indexul cuvantului 
            ++matrix(sequence_index, word_index); %incrementam frecventa cuvantului word_index in secventa sequence_index
        endif
    endfor
    retval = sparse(matrix(any(matrix, 2), :)); %eliminam liniile cu toate elementele 0
endfunction
