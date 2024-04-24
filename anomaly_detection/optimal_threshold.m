function [best_epsilon, best_F1, associated_precision, associated_recall] = optimal_threshold(truths, probabilities)
    best_epsilon = 0;
    best_F1 = 0;
    associated_precision = 0;
    associated_recall = 0;

    % Definirea unui vector de praguri
    step_size = (max(probabilities) - min(probabilities)) / 1000;
    thresholds = min(probabilities):step_size:max(probabilities);

    % Parcurgerea fiecărui prag
    for epsilon = thresholds
        % Calculul predicțiilor folosind pragul curent
        predictions = probabilities < epsilon;

        % Calculul preciziei
        [false_positives, ~, true_positives] = check_predictions(predictions, truths);
        precision = true_positives / (true_positives + false_positives);

        % Calculul acoperirii (recall)
        [~, false_negatives, true_positives] = check_predictions(predictions, truths);
        recall = true_positives / (true_positives + false_negatives);

        % Calculul scorului F1
        F1 = 2 * (precision * recall) / (precision + recall);

        % Actualizarea valorii optime, dacă este cazul
        if F1 > best_F1
            best_epsilon = epsilon;
            best_F1 = F1;
            associated_precision = precision;
            associated_recall = recall;
        end
    end
end
