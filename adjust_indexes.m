function [index_1, index_2] = adjust_indexes(sequence_1, sequence_2, k)
    is_k_negative = k < 0;

    k = abs(k);
    index_1.start = k + 1;
    index_2.start = 1;
    if length(sequence_1.Sequence) - index_1.start == length(sequence_2.Sequence)
        index_1.end = length(sequence_1.Sequence);
        index_2.end = length(sequence_2.Sequence);
    elseif length(sequence_1.Sequence) - index_1.start > length(sequence_2.Sequence)
        index_1.end = index_1.start + length(sequence_2.Sequence) - ~is_k_negative;
        index_2.end = length(sequence_2.Sequence) + is_k_negative;
    else
        index_1.end = length(sequence_1.Sequence);
        index_2.end = length(sequence_1.Sequence) - index_1.start + is_k_negative;
    end
end

