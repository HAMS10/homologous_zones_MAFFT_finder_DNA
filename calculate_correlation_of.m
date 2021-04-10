function [c_atgc_k, c_k, diagonals_2_search] = calculate_correlation_of(sequence_1_FFT, sequence_2_FFT)
    c_atgc_k = ifft(conj(sequence_1_FFT).*sequence_2_FFT);
    c_k = sum(c_atgc_k, 2);
    
    halft_size = floor(length(c_atgc_k) / 2);
    c_atgc_k = [c_atgc_k( halft_size + 1 : end, :); c_atgc_k(1 : halft_size, :)];
    c_k = [c_k( halft_size + 1 : end, :); c_k(1 : halft_size, :)];
    diagonals_2_search = find_diagonals_2_search(c_k, 20);
end

