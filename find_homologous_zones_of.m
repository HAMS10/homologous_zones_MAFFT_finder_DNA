function [homologous_zones] = find_homologous_zones_of(sequence_1, sequence_2, c_k, diagonals_2_search)
    windows_size = 30;
    
    max_number_of_windows = floor(max(length(sequence_1.Sequence), length(sequence_2.Sequence)) / 30);
        
    k_total_index = floor(- length(c_k) / 2 : length(c_k) / 2 - 1);
    k_values = k_total_index(diagonals_2_search);
    
    homologous_zones = zeros( max_number_of_windows, length(k_values) * 5);
        
    for k_index = 1 : length(k_values)
        k = k_values(k_index);
        if k >= 0
            [sequence_1_index, sequence_2_index] = adjust_indexes(sequence_1, sequence_2, k);
            [find_homologous_zones_in_k] = find_homologous_zones_in(k, sequence_1, sequence_2, sequence_1_index, sequence_2_index, windows_size);
        else
            [sequence_2_index, sequence_1_index] = adjust_indexes(sequence_2, sequence_1, k);
            [find_homologous_zones_in_k] = find_homologous_zones_in(k, sequence_2, sequence_1, sequence_2_index, sequence_1_index, windows_size);
        end
    end
end