function [] = plot_magnitude_spectrum_fft_of(fft_values, input_name)
    k = - length(fft_values) / 2 : length(fft_values) / 2 - 1;
    figure('Name', ['FFT Magnitude plot ', input_name]);
    t = tiledlayout(3,2,'TileSpacing','Compact');
    
    nexttile(t);
    plot(k, abs(fft_values(:,1)), 'color','#0072BD');
    title('FFT Magnitude of Adenine');
    legend('FFT_A(f)');
    grid minor;

    nexttile(t);
    plot(k, abs(fft_values(:,2)), 'color','#A2142F');
    title('FFT Magnitude of Thymine');
    legend('FFT_T(f)');
    grid minor;

    nexttile(t);
    plot(k, abs(fft_values(:,3)), 'color', '#D95319');
    title('FFT Magnitude of Guanine');
    legend('FFT_G(f)');
    grid minor;

    nexttile(t);
    plot(k, abs(fft_values(:,4)), 'color', '#7E2F8E');
    title('FFT Magnitude of Cytosine');
    legend('FFT_C(f)');
    grid minor;
    
    nexttile([1, 2]);
    plot(k, abs(fft_values));
    title('FFT Magnitude of all Nucleotides');
    legend('FFT_A(f)', 'FFT_T(f)', 'FFT_G(f)', 'FFT_C(f)');
    grid minor;
    
    title(t, ['FFT Magnitude plot ', 'nucleotides of ',input_name]);
    ylabel(t, '|FFT(n)|');
    xlabel(t, 'n');
end