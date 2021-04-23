function [] = plot_segmented_similarity_matrix(similarity_zones, sequence_1, sequence_2)
    similarity_matrix = zeros(length(sequence_1.Sequence), length(sequence_2.Sequence));
    for zone_index = 1 : length(similarity_zones)
            s1_start = similarity_zones(zone_index).s1_start;
            s1_final = similarity_zones(zone_index).s1_final;
            s2_start = similarity_zones(zone_index).s2_start;
            s2_final = similarity_zones(zone_index).s2_final;
            similarity_matrix(s1_start : s1_final, s2_start : s2_final) = similarity_matrix(s1_start : s1_final, s2_start : s2_final) + 1;
    end
    heatmap(similarity_matrix, 'GridVisible','off');
    colormap jet;
end

