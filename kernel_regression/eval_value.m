function pred = eval_value(x, X, f, f_param, a)
    % This function calculates the prediction made by a kernel-based model.
    % Inputs:
    %   x       - A row vector representing the input for which prediction is to be made.
    %   X       - A matrix containing all row vectors used to build the model.
    %   f       - A handle to the kernel function.
    %   f_param - The third parameter of the kernel function, which configures its behavior.
    %   a       - The column vector of estimated parameters used in the evaluation.
    
    % Number of training examples
    n = size(X, 1);
    
    % Initialize the prediction to zero
    pred = 0;
    
    % Compute the prediction as a weighted sum of kernel evaluations
    for i = 1:n
        % Evaluate the kernel function between x and each row of X
        kernel_value = f(x, X(i, :), f_param);
        
        % Add the weighted kernel value to the prediction
        pred = pred + a(i) * kernel_value;
    end
end
