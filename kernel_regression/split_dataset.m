function [X_train, y_train, X_pred, y_pred] = split_dataset(X, y, percentage)
    %calculeaza numarul de date pentru antrenare si testare
    total = size(X, 1);
    train = round(percentage * total);
    pred = total - train;
    
    %selectia datelor pentru antrenare
    X_train = X(1:train, :);
    y_train = y(1:train);
    
    %selecția datelor pentru predictie
    X_pred = X((train + 1):end, :);
    y_pred = y((train + 1):end);
endfunction
