function [] = plot_segmented_similarity_matrix(similarity_matrix_points, sequence_1, sequence_2)
    similarity_matrix = zeros(length(sequence_1.Sequence), length(sequence_2.Sequence));
    for points_index = 1 : length(similarity_matrix_points) - 1
            x_i = similarity_matrix_points(points_index, 1);
            y_i = similarity_matrix_points(points_index, 2);
            x_f = similarity_matrix_points(points_index + 1, 1);
            y_f = similarity_matrix_points(points_index + 1, 2);
        if points_index == 1
            similarity_matrix(x_i:x_f, y_i:y_f) = 1;
        else
            similarity_matrix(x_i + 1:x_f, y_i + 1:y_f) = 1;
        end
    end
    heatmap(similarity_matrix, 'GridVisible','off');
    colormap jet;
end

