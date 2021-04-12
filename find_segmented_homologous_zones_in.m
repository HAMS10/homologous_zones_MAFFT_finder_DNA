function [homologous_zones_for_k] = find_segmented_homologous_zones_in(k, sequence_1, sequence_2, sequence_1_index, sequence_2_index, windows_size)
    sequence_1.Sequence = sequence_1.Sequence(sequence_1_index.start : sequence_1_index.end);
    sequence_2.Sequence = sequence_2.Sequence(sequence_2_index.start : sequence_2_index.end);
    number_of_windows = ceil(length(sequence_1.Sequence) / windows_size) - 1;
    homologous_zones_for_k = zeros(number_of_windows, 5);

    for window_index = 1 : number_of_windows
        index_start_jumps = windows_size * (window_index - 1);
        index_end_jumps = windows_size * window_index;
        sum_of_pairs_index.start = 1 + index_start_jumps;
        sum_of_pairs_index.end = 1 + index_end_jumps;
        sum = sum_of_pairs(sequence_1.Sequence, sequence_2.Sequence, sum_of_pairs_index.start, sum_of_pairs_index.end);
            if k >= 0 
                homologous_zones_for_k(window_index, 1) = sequence_1_index.start + index_start_jumps;
                homologous_zones_for_k(window_index, 2) = sequence_2_index.start + index_start_jumps;
                homologous_zones_for_k(window_index, 3) = sequence_1_index.start + index_end_jumps;
                homologous_zones_for_k(window_index, 4) = sequence_2_index.start + index_end_jumps;
                homologous_zones_for_k(window_index, 5) = sum;
            else
                homologous_zones_for_k(window_index, 1) = sequence_2_index.start + index_start_jumps;
                homologous_zones_for_k(window_index, 2) = sequence_1_index.start + index_start_jumps;
                homologous_zones_for_k(window_index, 3) = sequence_2_index.start + index_end_jumps;
                homologous_zones_for_k(window_index, 4) = sequence_1_index.start + index_end_jumps;
                homologous_zones_for_k(window_index, 5) = sum;
            end
    end
end