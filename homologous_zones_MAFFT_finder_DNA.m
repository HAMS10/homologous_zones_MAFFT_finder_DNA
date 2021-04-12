clear; close all; clc;

global base_index
global PAM200

base_index = containers.Map({'a', 't', 'g', 'c'}, 1:4);

PAM200 = [  2.22  -1.39   -1.46   -1.86;
    -1.39   1.65   -1.74   -1.05;
    -1.46  -1.74    1.03   -2.48;
    -1.86  -1.05   -2.48    1.16];
%(1,2)(1,3)(1,4)(1,5)(1,6)(2,9)(4,7)(8,9)(9,10)
input_sequences = fastaread('balibase_mdsa_100s/RV12_BBS12039.afa', 'IgnoreGaps', true);
%(1, 2)
%input_sequences = fastaread('balibase_mdsa_all/RV12_BB12009.afa', 'IgnoreGaps', true);
%(1,4)(3,4)
%input_sequences = fastaread('balibase_mdsa_100s/RV11_BBS11025.afa', 'IgnoreGaps', true);
%(1,3)
%input_sequences = fastaread('balibase_mdsa_all/RV11_BBS11008.afa', 'IgnoreGaps', true);
%(1,3)(3,4)(6,7)
%input_sequences = fastaread('balibase_mdsa_100s/RV11_BBS11002.afa', 'IgnoreGaps', true);
%(1,4)(3,4)
%input_sequences = fastaread('balibase_mdsa_all/RV11_BB11025.afa', 'IgnoreGaps', true);

%(6,7)
%input_sequences = fastaread('orchidaceae_family/mRNA/orchidaceae_family.fasta', 'IgnoreGaps', true);

%input_sequences = fastaread('msa.afa');


sequence_1 = input_sequences(1);
sequence_2 = input_sequences(11);

windows_size = 30;
max_number_of_windows = ceil(max(length(sequence_1.Sequence), length(sequence_2.Sequence)) / windows_size) - 1;

size_sequence_1 = length(sequence_1.Sequence);
size_sequence_2 = length(sequence_2.Sequence);

max_lenght_between_groups = max_length_between(size_sequence_1, size_sequence_2);

frequencies_s1 = bases_counter(sequence_1, max_lenght_between_groups);
frequencies_s2 = bases_counter(sequence_2, max_lenght_between_groups);

fft_frequencies_s1 = fft(frequencies_s1, 2 * max_lenght_between_groups - 1);
fft_frequencies_s2 = fft(frequencies_s2, 2 * max_lenght_between_groups - 1);

[c_atgc_k, c_k, diagonals_2_search] = calculate_correlation_of(fft_frequencies_s1, fft_frequencies_s2);

% Plot Zone
% Plot sequencies frequencies
plot_frequencies_of(frequencies_s1, 'S1');
plot_frequencies_of(frequencies_s2, 'S2');

% Plot FFT magnitude
plot_bilateral_FFT_of(abs(fft_frequencies_s1), 'S1');
plot_bilateral_FFT_of(abs(fft_frequencies_s2), 'S2');

% Plot FFT Correlation
plot_bilateral_correlation_of(c_atgc_k, c_k, diagonals_2_search,'S1 vs S2');

%-------------------------------------------------------------------------------------------------------%


[segmented_homologous_zones, homologous_zones, k_values, homologous_cantity] = find_homologous_zones_of(sequence_1, sequence_2, c_k, diagonals_2_search, windows_size, max_number_of_windows);

[similarity_matrix_points] = segment_similarity_matrix(homologous_zones, max_number_of_windows, sequence_1, sequence_2);

%plot homologous zones
plot_zones(segmented_homologous_zones, homologous_zones, similarity_matrix_points, k_values, sequence_1, sequence_2);
