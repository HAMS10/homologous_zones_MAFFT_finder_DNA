function [index_1, index_2] = adjust_indexes(sequence_1, sequence_2, k)
    k = abs(k);
    index_1.start = k + 1;
    index_2.start = 1;
    if length(sequence_1.Sequence) - index_1.start == length(sequence_2.Sequence)
        index_1.end = length(sequence_1.Sequence);
        index_2.end = length(sequence_2.Sequence);
    elseif length(sequence_1.Sequence) - index_1.start > length(sequence_2.Sequence)
        index_1.end = index_1.start + length(sequence_2.Sequence);
        index_2.end = length(sequence_2.Sequence) + 1;
    else
        index_1.end = length(sequence_1.Sequence);
        index_2.end = length(sequence_1.Sequence) - index_1.start + 1;
    end
end

