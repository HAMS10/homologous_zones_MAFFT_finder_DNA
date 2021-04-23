function [] = plot_homologous_zones(zones, sequence_1, sequence_2)
    similarity_matrix = zeros(length(sequence_1.Sequence), length(sequence_2.Sequence));
    
    for zones_index = 1 : length(zones)
        for zone_index = 1: length(zones{zones_index})
            s1_start = zones{zones_index}(zone_index).s1_start;
            s1_final = zones{zones_index}(zone_index).s1_final;
            s2_start = zones{zones_index}(zone_index).s2_start;
            s2_final = zones{zones_index}(zone_index).s2_final;
            similarity_matrix(s1_start : s1_final, s2_start : s2_final) = similarity_matrix(s1_start : s1_final, s2_start : s2_final) + zones{zones_index}(zone_index).score;
        end
    end
    heatmap(similarity_matrix, 'GridVisible','off');
    colormap jet;
end

