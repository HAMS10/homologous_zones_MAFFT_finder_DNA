function [similarity_matrix_points] = segment_similarity_matrix(homologous_zones, max_number_of_windows, sequence_1, sequence_2)

    k_index_start = 1 : max_number_of_windows : length(homologous_zones);
    k_index = zeros(1, length(k_index_start));

    points_index = k_index + k_index_start;
    index_2_compare = find(homologous_zones(points_index, 5));

    are_indexes_valid = isempty(index_2_compare);
    is_first_iteration = true;
    
    similarity_matrix_points = ones(1,2);
    while ~are_indexes_valid

        if is_first_iteration
            is_first_iteration = false;
            homologous_zones(points_index(index_2_compare), 5);
            [max_value, max_index] = max(homologous_zones(points_index(index_2_compare), 5));
            temp_point = homologous_zones(points_index(index_2_compare(max_index)), 1:4);
            actual_point = [ temp_point(1) +  temp_point(3), temp_point(2) +  temp_point(4)] / 2;
            similarity_matrix_points = [similarity_matrix_points; actual_point];
            k_index(index_2_compare(max_index)) = k_index(index_2_compare(max_index)) + 1;
        else
            invalid_x_index = find(homologous_zones(points_index(index_2_compare), 1) < actual_point(1));
            invalid_y_index = find(homologous_zones(points_index(index_2_compare), 2) < actual_point(2));
            if ~isempty(invalid_x_index)
                k_index(index_2_compare(invalid_x_index)) = k_index(index_2_compare(invalid_x_index)) + 1;
            elseif ~isempty(invalid_y_index)
                k_index(index_2_compare(invalid_y_index)) = k_index(index_2_compare(invalid_y_index)) + 1;
            else
                [max_value, max_index] = max(homologous_zones(points_index(index_2_compare), 5));
                temp_point = homologous_zones(points_index(index_2_compare(max_index)), 1:4);
                actual_point = [ temp_point(1) +  temp_point(3), temp_point(2) +  temp_point(4)] / 2;
                similarity_matrix_points = [similarity_matrix_points; actual_point];
                k_index(index_2_compare(max_index)) = k_index(index_2_compare(max_index)) + 1;
            end
        end
        points_index = k_index + k_index_start;
        index_2_compare = find(homologous_zones(points_index, 5));
        are_indexes_valid = isempty(index_2_compare);
    end
    similarity_matrix_points = [similarity_matrix_points; [length(sequence_1.Sequence), length(sequence_2.Sequence)]];
end
