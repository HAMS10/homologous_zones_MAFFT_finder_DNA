function [max_sequence_lenght] = max_lenght_of(input_sequences)
    sequences_length = zeros(1, length(input_sequences));
    
    for sequence_index = 1 : length(input_sequences)
        sequences_length(sequence_index) = length(input_sequences(sequence_index).Sequence);
    end
    max_sequence_lenght = max(sequences_length);
end

