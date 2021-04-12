function [] = plot_bilateral_FFT_of(FFT_values, message)

    halft_size = floor(length(FFT_values) / 2);
    k = floor(- length(FFT_values) / 2 : length(FFT_values) / 2 - 1);
    FFT_values = [FFT_values( halft_size + 1 : end, :); FFT_values(1 : halft_size, :)];
    
    h = figure('Name', ['Bilateral FFT of :', message]);
    t = tiledlayout(3,2,'TileSpacing','Compact');
    
    nexttile(t);
    plot(k, abs(FFT_values(:,1)), 'color','#0072BD');
    title([ message, ':Bilateral FFT of Adenine Nucleotide']);
    legend('FFT_A(f)');
    grid minor;

    nexttile(t);
    plot(k, abs(FFT_values(:,2)), 'color','#A2142F');
    title([message, ':Bilateral FFT of Thymine Nucleotide']);
    legend('FFT_T(f)');
    grid minor;

    nexttile(t);
    plot(k, abs(FFT_values(:,3)), 'color', '#D95319');
    title([message, ':Bilateral FFT of Guanine Nucleotide']);
    legend('FFT_G(f)');
    grid minor;

    nexttile(t);
    plot(k, abs(FFT_values(:,4)), 'color', '#7E2F8E');
    title([message, ':Bilateral FFT of Cytosine Nucleotide']);
    legend('FFT_C(f)');
    grid minor;
    
    nexttile([1, 2]);
    plot(k, abs(FFT_values));
    title([message, ':Bilateral FFT of all Nucleotides']);
    legend('FFT_A(f)', 'FFT_T(f)', 'FFT_G(f)', 'FFT_C(f)');
    grid minor;
    
    title(t, message);
    ylabel(t, '|FFT(f)|');
    xlabel(t, 'f');
end