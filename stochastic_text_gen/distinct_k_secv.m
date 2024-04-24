function unique_cell_array = distinct_k_secv (cell_array)
    unique_secv = unique(cell_array);
    
    unique_cell_array= sort(unique_secv);
endfunction