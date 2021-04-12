function [] = plot_homologous_zones(segmented_homologous_zones, homologous_zones, k_values, sequence_1, sequence_2)
    figure();
    minor_value = min(homologous_zones(:,5));
    similarity_matrix = zeros(length(sequence_1.Sequence), length(sequence_2.Sequence)) + minor_value;
    max_number_of_windows = ceil(max(length(sequence_1.Sequence), length(sequence_2.Sequence)) / 30) - 1;

    for homologous_zone_index = 1 : length(k_values)

        for k_zone_index = (1 : max_number_of_windows) + max_number_of_windows * (homologous_zone_index - 1)
            
                x_i = homologous_zones(k_zone_index, 1);
                y_i = homologous_zones(k_zone_index, 2);
                x_f = homologous_zones(k_zone_index, 3);
                y_f = homologous_zones(k_zone_index, 4);
                are_diferent_2_zeros = ~((x_i == x_f ) || (y_i == y_f));

                if are_diferent_2_zeros && (homologous_zones(k_zone_index, 5) > 0.7)
                    similarity_matrix(x_i:x_f, y_i:y_f) = similarity_matrix(x_i:x_f, y_i:y_f) + homologous_zones(k_zone_index, 5);
                end
        end
    end
    
    heatmap(similarity_matrix, 'GridVisible','off');
    colormap jet;
end

