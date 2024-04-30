function retval = sample_n_words(text, word_set, kscv_set, k, stoch, n)
    retval = text;
    for i = 1:n
        next_word = sample_next_word(retval, word_set, kscv_set, k, stoch, n); %extragem urmatorul cuvant
        retval = [retval ' ' next_word]; %adaugam cuvantul la text
    end
end
