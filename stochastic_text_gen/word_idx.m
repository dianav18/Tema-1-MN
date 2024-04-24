function retval = word_idx(distinct_wds)
    % Creăm un container Map gol
    retval = containers.Map('KeyType', 'char', 'ValueType', 'int32');
    
    % Parcurgem fiecare cuvânt din array-ul de cuvinte distincte
    for i = 1:length(distinct_wds)
        word = distinct_wds{i};  % Extragem fiecare cuvânt
        retval(word) = i;  % Asociem cuvântul cu indicele său
    end
end
