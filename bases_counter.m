function [frequencies] = bases_counter(input_sequences, max_sequence_lenght)
    %bases frequencie order A|T|G|C
    frequencies = zeros(max_sequence_lenght, 4);
    
    for sequence_index = 1 : length(input_sequences)
        
        for base_index = 1 : length(input_sequences(sequence_index).Sequence)
            nucleotide = input_sequences(sequence_index).Sequence(base_index);
            
            switch nucleotide
                case {'a', 'A'}
                    frequencies(base_index, 1) = frequencies(base_index, 1) + 1;
                case {'t', 'T'}
                    frequencies(base_index, 2) = frequencies(base_index, 2) + 1;
                case {'g', 'G'}
                    frequencies(base_index, 3) = frequencies(base_index, 3) + 1;
                case {'c', 'C'}
                    frequencies(base_index, 4) = frequencies(base_index, 4) + 1;
            end
        end
    end
end