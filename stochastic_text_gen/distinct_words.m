function retval = distinct_words(tokens)
    unique_tokens = unique(tokens);
    sorted_tokens = sort(unique_tokens);
    retval = sorted_tokens;
end
