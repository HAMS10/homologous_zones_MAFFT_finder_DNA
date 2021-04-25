function [all_zones, zones] = find_homologous_zones_of(sequence_1, sequence_2, k, windows_size)
    all_zones_format = struct(struct('s1_start', {}, 's1_final', {}, 's2_start', {}, 's2_final', {}, 'score', {}));
    all_zones = {};
    all_zones_counter = 1;
    all_zones = [all_zones, {all_zones_format}];
    zones = {};
    
    actual_zone = struct('s1_start', 0.0, 's1_final', 0.0, 's2_start', 0.0, 's2_final', 0.0, 'score', 0.0);
    
    for k_value = k
        k_value
        sequence_1_size = length(sequence_1.Sequence);
        sequence_2_size = length(sequence_2.Sequence);
        
        if k_value >= 0
            [complete_zone] = adjust_indexes(sequence_1_size, sequence_2_size, k_value);
        else
            [complete_zone] = adjust_indexes(sequence_2_size, sequence_1_size, -k_value);
            tmp = complete_zone.s1_start;
            complete_zone.s1_start = complete_zone.s2_start;
            complete_zone.s2_start = tmp;
            tmp = complete_zone.s1_final;
            complete_zone.s1_final = complete_zone.s2_final;
            complete_zone.s2_final = tmp;
        end
        windows = fix((complete_zone.s1_final - complete_zone.s1_start + 1) / windows_size);
        
        is_first_zone = true;
        zones_counter = 1;
        for windows_index = 0 : windows - 1
            constant_start = windows_size * windows_index;
            constant_final = windows_size * (windows_index + 1);
            actual_zone.s1_start = complete_zone.s1_start + constant_start;
            actual_zone.s1_final = complete_zone.s1_start + constant_final - 1;
            actual_zone.s2_start = complete_zone.s2_start + constant_start;
            actual_zone.s2_final = complete_zone.s2_start + constant_final - 1;
            
            actual_zone.score = sum_of_pairs(sequence_1, sequence_2, actual_zone, windows_size);
            actual_zone.score
            all_zones{1}(all_zones_counter) = actual_zone;
            all_zones_counter = all_zones_counter + 1;
            is_valid_zone = actual_zone.score > 0.7;
            
            if is_valid_zone
                if is_first_zone
                    is_first_zone = false;
                    zones = [zones, {all_zones_format}];
                    zones{length(zones)}(zones_counter) = actual_zone;
                    zones_counter = zones_counter + 1;
                else
                    zones{length(zones)}(zones_counter) = actual_zone;
                    zones_counter = zones_counter + 1;
                end
            end
            
            
        end
    end
end