function probability = gaussian_distribution(X, mean_value, variance)
    % Calculează exponentul din distribuția gaussiană
    exponent = -(X - mean_value).^2 / (2 * variance);
    
    % Calculează probabilitatea
    probability = exp(exponent) / sqrt(2 * pi * variance);
endfunction
