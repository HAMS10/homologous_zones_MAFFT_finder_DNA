function [sum] = sum_of_pairs(sequence_1, sequence_2, start_index, end_index)
    sum = 0.0;
    for base_index = start_index : end_index
        sum = sum + compare_nucleotides(sequence_1(base_index), sequence_2(base_index));
    end
end

