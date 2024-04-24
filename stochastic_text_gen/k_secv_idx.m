function retval = k_secv_idx(distinct_k_sec)
    % Creăm un container Map gol
    retval = containers.Map('KeyType', 'char', 'ValueType', 'int32');
    
    % Parcurgem fiecare secvență din array-ul de secvențe k distincte
    for i = 1:length(distinct_k_sec)
        sequence = distinct_k_sec{i};  % Extragem fiecare secvență
        retval(sequence) = i;  % Asociem secvența cu indicele său
    end
end
