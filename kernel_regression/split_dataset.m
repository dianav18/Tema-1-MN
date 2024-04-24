function [X_train, y_train, X_pred, y_pred] = split_dataset(X, y, percentage)
    % Calculează numărul de date pentru antrenare și testare
    num_total = size(X, 1);
    num_train = round(percentage * num_total);
    num_pred = num_total - num_train;
    
    % Selecția datelor pentru antrenare
    X_train = X(1:num_train, :);
    y_train = y(1:num_train);
    
    % Selecția datelor pentru predicție
    X_pred = X((num_train + 1):end, :);
    y_pred = y((num_train + 1):end);
end
