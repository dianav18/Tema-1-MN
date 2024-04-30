% Functie care calculeaza densitatea de probabilitate a unei distributii gaussiene multivariate
function probabilities = multivariate_gaussian(X, mean_values, variances)
    [~, n] = size(X);
    differences = X - mean_values;
    exponent = -0.5 * sum((differences * inv(variances)) .* differences, 2); % Exponentul din densitatea de probabilitate
    normalization = (2 * pi) ^ (-n / 2) * det(variances) ^ (-0.5); % Numitorul din densitatea de probabilitate
    probabilities = normalization * exp(exponent); % Densitatea de probabilitate
endfunction
