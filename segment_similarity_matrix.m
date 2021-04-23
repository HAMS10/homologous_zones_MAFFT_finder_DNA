function [similarity_zones] = segment_similarity_matrix(sequence_1, sequence_2, organized_zones)
similarity_zones = struct(struct('s1_start', {}, 's1_final', {}, 's2_start', {}, 's2_final', {}, 'score', {}));
segment_counter = 1;
actual_zone = struct('s1_start', 1.0, 's1_final', 0.0, 's2_start', 1.0, 's2_final', 0.0, 'score', 0.0);

while(~isempty(organized_zones))
    compare_array = zeros(length(organized_zones), 1);
    are_non_empty_struct_array = false;
    for organized_zones_index = 1 : length(organized_zones)
        is_non_empty_data = ~isempty(organized_zones{organized_zones_index});
        are_non_empty_struct_array = bitor(are_non_empty_struct_array, is_non_empty_data);
        if is_non_empty_data
            compare_array(organized_zones_index) = organized_zones{organized_zones_index}(1).score;
        end
        
    end
    if are_non_empty_struct_array
        [garbage, zones_index] = sort(compare_array);
        index = zones_index(length(zones_index));
        actual_zone.s1_final = organized_zones{index}(1).s1_start + ...
            (organized_zones{index}(1).s1_final - organized_zones{index}(1).s1_start + 1) / ...
            2 - ...
            1;
        actual_zone.s2_final = organized_zones{index}(1).s2_start + ...
            (organized_zones{index}(1).s2_final - organized_zones{index}(1).s2_start + 1) / ...
            2 - ...
            1;
        similarity_zones(segment_counter) = actual_zone;
        segment_counter = segment_counter + 1;
        
        for organized_zones_index = 1 : length(organized_zones)
            are_invalid_index = true;
            while (~isempty(organized_zones{organized_zones_index})) && (are_invalid_index)
                are_invalid_index = (actual_zone.s1_final > ...
                    organized_zones{organized_zones_index}(1).s1_start) || ...
                    (actual_zone.s2_final > ...
                    organized_zones{organized_zones_index}(1).s2_start);
                if are_invalid_index
                    organized_zones{organized_zones_index}(1) = [];
                end
            end
        end
        actual_zone.s1_start = actual_zone.s1_final + 1;
        actual_zone.s2_start = actual_zone.s2_final + 1;
    else
        break;
    end
    
end
actual_zone.s1_final = length(sequence_1.Sequence);
actual_zone.s2_final = length(sequence_2.Sequence);
similarity_zones(segment_counter) = actual_zone;
end
