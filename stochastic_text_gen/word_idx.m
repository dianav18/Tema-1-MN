function retval = word_idx (distinct_wds)
	%foloseste un map pentru a asocia fiecarui cuvant un index
	retval = containers.Map(distinct_wds, 1:length(distinct_wds));
endfunction