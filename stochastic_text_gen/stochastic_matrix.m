function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_set, k_secv_set, k)
    % Map all k-sequences and words to indices in their respective sets
    [ismem_k_secv, idx_k_secv] = ismember(k_secv_corpus, k_secv_set);
    [ismem_words, idx_words] = ismember(corpus_words, words_set);

    % Initialize the transition matrix
    corpus_words_len = length(corpus_words);
    words_set_len = length(words_set);
    transition_matrix = zeros(corpus_words_len - k, words_set_len);

    % Populate the transition matrix using precomputed indices
    for index = 1:(corpus_words_len - k)
        if ismem_k_secv(index) && ismem_words(index + k)
            sequence_index = idx_k_secv(index);
            word_index = idx_words(index + k);
            transition_matrix(sequence_index, word_index) += 1;
        end
    end

    % Remove rows that contain only zeros
    nonzero_rows = any(transition_matrix, 2);
    filtered_matrix = transition_matrix(nonzero_rows, :);

    % Convert to sparse matrix format
    retval = sparse(filtered_matrix);
end
