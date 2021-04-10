function [homologous_zones] = find_homologous_zones_of(sequence_1, sequence_2, c_k, diagonals_2_search)
    window_size = 30;
    
    max_number_of_windows = floor(max(length(sequence_1.Sequence), length(sequence_2.Sequence)) / 30);
        
    k_total_index = floor(- length(c_k) / 2 : length(c_k) / 2 - 1);
    k_values = k_total_index(diagonals_2_search);
    
    homologous_zones = zeros( max_number_of_windows, length(k_values) * 5);
        
    for k_index = 1 : length(k_values)
        k = k_values(k_index);
        [seq_1_index, seq_2_index] = adjust_indexes(sequence_1, sequence_2, k)
    end
end