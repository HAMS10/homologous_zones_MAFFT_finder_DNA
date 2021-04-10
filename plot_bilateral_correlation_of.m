function [] = plot_bilateral_correlation_of(c_atgc_k, c_k, diagonals_2_search, message)
    k = floor(- length(c_atgc_k) / 2 : length(c_atgc_k) / 2 - 1);

    figure('Name', "Correlation");
    t = tiledlayout(3,2,'TileSpacing','Compact');

    nexttile(t);
    plot(k, c_atgc_k(:,1), 'color','#0072BD');
    title([ message, 'Correlation of Adenine Nucleotide']);
    legend('c_A(k)');
    grid minor;

    nexttile(t);
    plot(k, c_atgc_k(:,2), 'color','#A2142F');
    title([message, 'Correlation of Thymine Nucleotide']);
    legend('c_T(k)');
    grid minor;

    nexttile(t);
    plot(k, c_atgc_k(:,3), 'color', '#D95319');
    title([message, 'Correlation of Guanine Nucleotide']);
    legend('c_G(k)');
    grid minor;

    nexttile(t);
    plot(k, c_atgc_k(:,4), 'color', '#7E2F8E');
    title([message, 'Correlation of Cytosine Nucleotide']);
    legend('c_C(k)');
    grid minor;

    nexttile([1, 2]);
    plot(k, c_k);
    hold on;
    scatter(k(diagonals_2_search), c_k(diagonals_2_search), 'xr');
    title([message, 'Correlation of all Nucleotides']);
    legend('c(k)');
    grid minor;

    title(t, message);
    ylabel(t, 'c(k)');
    xlabel(t, 'k');
end