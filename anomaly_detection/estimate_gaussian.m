% Functie care estimeaza media si varianta pentru fiecare coloana a matricei X
function [mean_values variances] = estimate_gaussian(X)
    [m, ~] = size(X); %extragem dimensiunile matricei
    sum_values = sum(X); %calculam suma valorilor
    mean_values = sum_values / m; %calculam vectorul medie
    differences = X - mean_values; %calculam diferenta dintre fiecare valoare si media
    variances = (1/m) * (differences' * differences); %calculam matricea de varianta
endfunction
