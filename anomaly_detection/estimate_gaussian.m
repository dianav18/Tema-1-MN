% This function estimates the parameters of a Gaussian distribution using the data in X.
function [mean_values variances] = estimate_gaussian(X)
    mean_values = mean(X);
    m = size(X, 1);
    differences = X - mean_values;
    variances = (1/m) * (differences' * differences);
endfunction
