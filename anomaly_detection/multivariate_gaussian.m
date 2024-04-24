function probabilities = multivariate_gaussian(X, mean_values, variances)
    n = size(X, 2); % Numărul de dimensiuni
    exponent = -0.5 * sum(((X - mean_values) / variances) .* (X - mean_values), 2); % Exponențiala din distribuția gaussiană
    normalization = (2 * pi) ^ (-n / 2) * det(variances) ^ (-0.5); % Factorul de normalizare
    probabilities = normalization * exp(exponent); % Densitatea de probabilitate
end
