function retval = k_secv_idx (distinct_k_sec)
	%foloseste un map pentru a asocia fiecarei secvente de k cuvinte un index
	retval = containers.Map(distinct_k_sec, 1:length(distinct_k_sec));
endfunction