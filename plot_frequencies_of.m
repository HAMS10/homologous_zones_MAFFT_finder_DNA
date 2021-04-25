function [] = plot_frequencies_of(frequencies_values, input_name)
    h = figure();
    t = tiledlayout(3, 2,'TileSpacing','Compact');
    nexttile;
    stem(frequencies_values(:,1), 'color','#0072BD');
    title("Count of Adenine")
    legend('f_A(n)');
    grid on;

    nexttile;
    stem(frequencies_values(:,2), 'color','#A2142F');
    title("Count of Thymine")
    legend('f_T(n)');
    grid on;

    nexttile;
    stem(frequencies_values(:,3), 'color', '#D95319');
    title("Count of Guanine")
    legend('f_G(n)');
    grid on;

    nexttile;
    stem(frequencies_values(:,4), 'color', '#7E2F8E');
    title('Count of Cytosine');
    legend('f_C(n)');
    grid on;
    
    nexttile([1, 2]);
    stem(frequencies_values);
    title('Count of all Nucleotides');
    legend('f_A(n)', 'f_T(n)', 'f_G(n)', 'f_C(n)');
    grid minor;
    
    title(t, ['Nucleotides ', 'count of ', input_name]);
    ylabel(t, 'F(n)');
    xlabel(t, 'n');
end

