clear; close all; clc;

global base_index
global PAM200

base_index = containers.Map({'a', 't', 'g', 'c'}, 1:4);

PAM200 = ...
[2.22  -1.39   -1.46   -1.86;
-1.39   1.65   -1.74   -1.05;
-1.46  -1.74    1.03   -2.48;
-1.86  -1.05   -2.48    1.16];

%(1,2)(1,3)(1,4)(1,6)(3, 4)(3, 6)(3, 7)(4,7)(4, 10)(8,9)(8, 10)(8, 11)(9,10)
%(1, 5)(2, 9)
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
sequence_2 = input_sequences(3);

windows_size = 30;
max_number_of_windows = fix(max(length(sequence_1.Sequence), length(sequence_2.Sequence)) / windows_size);

size_sequence_1 = length(sequence_1.Sequence);
size_sequence_2 = length(sequence_2.Sequence);

max_lenght_between_groups = max_length_between(size_sequence_1, size_sequence_2);
frequencies_s1 = bases_counter(sequence_1, 1024);
frequencies_s2 = bases_counter(sequence_2, 1024);

fft_frequencies_s1 = fft(frequencies_s1, 1024);
fft_frequencies_s2 = fft(frequencies_s2, 1024);

[c_atgc_k, c_k] = calculate_correlation_of(fft_frequencies_s1, fft_frequencies_s2);
k_index = find_diagonals_2_search(c_k, 20);

% Plot Zone
% Plot sequencies frequencies
plot_frequencies_of(frequencies_s1, 'S1');
plot_frequencies_of(frequencies_s2, 'S2');

% Plot FFT magnitude
plot_bilateral_FFT_of(abs(fft_frequencies_s1), 'S1');
plot_bilateral_FFT_of(abs(fft_frequencies_s2), 'S2');

% Plot FFT Correlation
plot_bilateral_correlation_of(c_atgc_k, c_k, k_index,'S1 vs S2');

%-------------------------------------------------------------------------------------------------------%
k_total_index = fix(- length(c_k) / 2 : length(c_k) / 2 - 1);
k = k_total_index(k_index);
[all_zones, zones] = find_homologous_zones_of(sequence_1, sequence_2, k, windows_size);
[organized_zones] = organize_zones(zones);
[similarity_zones] = segment_similarity_matrix(sequence_1, sequence_2, organized_zones);

% %plot homologous zones
plot_zones(all_zones, zones, organized_zones, similarity_zones, sequence_1, sequence_2);
