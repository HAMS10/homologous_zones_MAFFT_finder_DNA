function [complete_zone] = adjust_indexes(sequence_1_size, sequence_2_size, k)
    complete_zone = struct('s1_start', 0.0, 's1_final', 0.0, 's2_start', 0.0, 's2_final', 0.0, 'score', 0.0);
    complete_zone.s1_start = k + 1;
    complete_zone.s2_start = 1;
    if (sequence_1_size - k) >= sequence_2_size
        complete_zone.s1_final = sequence_1_size - (sequence_1_size -k - sequence_2_size);
        complete_zone.s2_final = sequence_2_size;
    else
        complete_zone.s1_final = sequence_1_size;
        complete_zone.s2_final = sequence_1_size - k;
    end
end

