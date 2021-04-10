function [max_lenght_between_group] = max_length_between(sequence_0_length, sequence_1_length)
    if sequence_0_length > sequence_1_length
        max_lenght_between_group = sequence_0_length;
    else
        max_lenght_between_group = sequence_1_length;
    end
end

