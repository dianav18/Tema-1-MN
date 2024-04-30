function [best_epsilon, best_F1, associated_precision, associated_recall] = optimal_threshold(truths, probabilities)
    best_epsilon = 0;
    best_F1 = 0;
    associated_precision = 0;
    associated_recall = 0;

    step_size = (max(probabilities) - min(probabilities)) / 1000;
    thresholds = min(probabilities):step_size:max(probabilities);

    for epsilon = thresholds
        predictions = probabilities < epsilon;
        [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths);

        [precision, recall, F1] = metrics(true_positives, false_positives, false_negatives);

        if F1 > best_F1
            best_epsilon = epsilon;
            best_F1 = F1;
            associated_precision = precision;
            associated_recall = recall;
        end
    end
end
