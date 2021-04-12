function [segmented_homologous_zones, all_homologous_zones,k_values, homologous_cantity] = find_homologous_zones_of(sequence_1, sequence_2, c_k, diagonals_2_search, windows_size, max_number_of_windows)  
    k_total_index = floor(- length(c_k) / 2 : length(c_k) / 2 - 1);
    k_values = k_total_index(diagonals_2_search);
    homologous_cantity = zeros(size(k_values));
    segmented_homologous_zones = zeros( max_number_of_windows * length(k_values), 5);
    all_homologous_zones = zeros( max_number_of_windows * length(k_values), 5);
    
    for k_index = 1 : length(k_values)
        k = k_values(k_index);
        if k >= 0
            [sequence_1_index, sequence_2_index] = adjust_indexes(sequence_1, sequence_2, k);
            
            [find_homologous_zones_in_k] = find_segmented_homologous_zones_in(k, sequence_1, sequence_2, sequence_1_index, sequence_2_index, windows_size);
            segmented_homologous_zones(( 1 : size(find_homologous_zones_in_k, 1) ) + max_number_of_windows * (k_index - 1), 1 : 5 ) = find_homologous_zones_in_k;
            
            [find_homologous_zones_in_k, homologous_cantity(k_index)] = find_homologous_zones_in(k, sequence_1, sequence_2, sequence_1_index, sequence_2_index, windows_size);
            all_homologous_zones(( 1 : size(find_homologous_zones_in_k, 1) ) + max_number_of_windows * (k_index - 1), 1 : 5 ) = find_homologous_zones_in_k;
        else
            [sequence_2_index, sequence_1_index] = adjust_indexes(sequence_2, sequence_1, k);
            
            [find_homologous_zones_in_k] = find_segmented_homologous_zones_in(k, sequence_2, sequence_1, sequence_2_index, sequence_1_index, windows_size);
            segmented_homologous_zones(( 1 : size(find_homologous_zones_in_k, 1) ) + max_number_of_windows * (k_index - 1), 1 : 5 ) = find_homologous_zones_in_k;
            
            [find_homologous_zones_in_k, homologous_cantity(k_index)] = find_homologous_zones_in(k, sequence_2, sequence_1, sequence_2_index, sequence_1_index, windows_size);
            all_homologous_zones(( 1 : size(find_homologous_zones_in_k, 1) ) + max_number_of_windows * (k_index - 1), 1 : 5 ) = find_homologous_zones_in_k;        
        end
    end
end