function [] = plot_zones(segmented_homologous_zones, homologous_zones, similarity_matrix_points, k_values, sequence_1, sequence_2)
    h = figure('Name', 'Similarity Matrix Segmented');
    t = tiledlayout(2, 2,'TileSpacing','Compact');
    nexttile(t);
    plot_all_posible_homologous_zones(segmented_homologous_zones, k_values, sequence_1, sequence_2);
    title('Homologous zones : All posible zones');
    nexttile(t);
    plot_segmented_homologous_zones(segmented_homologous_zones, k_values, sequence_1, sequence_2);
    title('Homologous zones : All that passed the threshold 0.7');
    nexttile(t);
    plot_segmented_homologous_zones(homologous_zones, k_values, sequence_1, sequence_2);
    title('Homologous zones : Union of segment');
    nexttile(t);
    plot_segmented_similarity_matrix(similarity_matrix_points, sequence_1, sequence_2);
    title('Similarity Matrix Segmented by FFT');
    
    title(t, "Similarity Matrix Segmented by FFT");
    ylabel(t, 'Sequence 0');
    xlabel(t, 'Sequence 1');
end

