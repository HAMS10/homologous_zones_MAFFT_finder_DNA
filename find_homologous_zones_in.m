function [homologous_zones_for_k, zone_index] = find_homologous_zones_in(k, sequence_1, sequence_2, sequence_1_index, sequence_2_index, windows_size)
    sequence_1.Sequence = sequence_1.Sequence(sequence_1_index.start : sequence_1_index.end);
    sequence_2.Sequence = sequence_2.Sequence(sequence_2_index.start : sequence_2_index.end);
    number_of_windows = ceil(length(sequence_1.Sequence) / windows_size) - 1;
    homologous_zones_for_k = zeros(number_of_windows, 5);

    zone_index = 1;
    is_contigous_zone = false;
    number_of_segment = 5;

    for window_index = 1 : number_of_windows
        index_start_jumps = windows_size * (window_index - 1);
        index_end_jumps = windows_size * window_index;
        sum_of_pairs_index.start = 1 + index_start_jumps;
        sum_of_pairs_index.end = 1 + index_end_jumps;
        sum = sum_of_pairs(sequence_1.Sequence, sequence_2.Sequence, sum_of_pairs_index.start, sum_of_pairs_index.end);

        if sum > 0.7
            if k >= 0 && number_of_segment < 5 && is_contigous_zone
                if number_of_segment < 5 && is_contigous_zone

                    homologous_zones_for_k(zone_index - 1, 3) = sequence_1_index.start + index_end_jumps;
                    homologous_zones_for_k(zone_index - 1, 4) = sequence_2_index.start + index_end_jumps;
                    homologous_zones_for_k(zone_index - 1, 5) = homologous_zones_for_k(zone_index, 5) + sum;
                    is_contigous_zone = true;
                    number_of_segment = number_of_segment + 1;
                else
                    homologous_zones_for_k(zone_index, 1) = sequence_1_index.start + index_start_jumps;
                    homologous_zones_for_k(zone_index, 2) = sequence_2_index.start + index_start_jumps;
                    homologous_zones_for_k(zone_index, 3) = sequence_1_index.start + index_end_jumps;
                    homologous_zones_for_k(zone_index, 4) = sequence_2_index.start + index_end_jumps;
                    homologous_zones_for_k(zone_index, 5) = sum;
                    zone_index = zone_index + 1;
                    is_contigous_zone = true;
                    number_of_segment = 1;
                end
            else
                if number_of_segment < 5 && is_contigous_zone
                    homologous_zones_for_k(zone_index - 1, 3) = sequence_2_index.start + index_end_jumps;
                    homologous_zones_for_k(zone_index - 1, 4) = sequence_1_index.start + index_end_jumps;
                    homologous_zones_for_k(zone_index - 1, 5) = homologous_zones_for_k(zone_index, 5) + sum;
                    is_contigous_zone = true;
                    number_of_segment = number_of_segment + 1;
                else
                    homologous_zones_for_k(zone_index, 1) = sequence_2_index.start + index_start_jumps;
                    homologous_zones_for_k(zone_index, 2) = sequence_1_index.start + index_start_jumps;
                    homologous_zones_for_k(zone_index, 3) = sequence_2_index.start + index_end_jumps;
                    homologous_zones_for_k(zone_index, 4) = sequence_1_index.start + index_end_jumps;
                    homologous_zones_for_k(zone_index, 5) = sum;
                    zone_index = zone_index + 1;
                    is_contigous_zone = true;
                    number_of_segment = 1;
                end
            end
        else
            is_contigous_zone = false;
        end
    end
    zone_index = zone_index - 1;
end
