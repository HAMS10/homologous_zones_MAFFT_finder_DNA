function [index_1, index_2] = adjust_indexes(seq_0, seq_1, k)
    index_1.start = k + 1;
    index_2.start = 1;
    if length(seq_0) >= length(seq_1)    
        index_1.end = length(seq_1);
        index_2.end = length(seq_1);
    else
        index_1.end = length(seq_0);
        index_2.end = length(seq_0);
    end
end

