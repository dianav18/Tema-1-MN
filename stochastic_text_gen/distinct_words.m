function retval = distinct_words(tokens)
    % Use the unique function to find unique tokens
    unique_tokens = unique(tokens);
    
    % Sort the unique tokens
    sorted_tokens = sort(unique_tokens);
    
    % Return the sorted and unique tokens
    retval = sorted_tokens;
end
