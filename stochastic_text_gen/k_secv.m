function B = k_secv(A, k)
    % Inițializăm B ca un cell-array gol de dimensiune [0,1] pentru a obține o structură coloană
    B = cell(0,1);

    % Calculăm numărul de secvențe posibile
    numSequences = length(A) - k;  % Am scăzut încă unul pentru a ignora ultima secvență

    % Generăm fiecare secvență și o adăugăm în B
    for i = 1:numSequences
        % Extragem secvența de k elemente
        sequence = A(i:i+k-1);
        
        % Concatenăm elementele secvenței într-un singur string, cu spații între elemente
        concatenatedSequence = strjoin(sequence, ' ');
        
        % Adăugăm secvența concatenată la cell-array-ul B
        B{end+1, 1} = concatenatedSequence;  % Notează adăugarea ',1' pentru structura de coloană
    end
end
