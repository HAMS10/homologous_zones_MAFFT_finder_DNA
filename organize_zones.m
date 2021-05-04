function [organized_zones] = organize_zones(zones)
all_zones_format = struct(struct('s1_start', {}, 's1_final', {}, 's2_start', {}, 's2_final', {}, 'score', {}));
last_zone = struct('s1_start', 0.0, 's1_final', 0.0, 's2_start', 0.0, 's2_final', 0.0, 'score', 0.0);
actual_zone = struct('s1_start', 0.0, 's1_final', 0.0, 's2_start', 0.0, 's2_final', 0.0, 'score', 0.0);
organized_zones = {};
zones_counter = 1;
is_first_zone = true;
are_contigous_zone = false;
is_valid_contigous_zone = false;
contigous_count = 0;
max_windows_join = 5;
if ~isempty(zones)
    for zones_index = 1 : length(zones)
        
        if ~is_first_zone
            organized_zones{length(organized_zones)}(zones_counter) = last_zone;
        end
        is_first_zone = true;
        
        for zone_index = 1 : length(zones{zones_index})
            actual_zone = zones{zones_index}(zone_index);
            if is_first_zone
                is_first_zone = false;
                organized_zones = [organized_zones, {all_zones_format}];
                zones_counter = 1;
                last_zone = actual_zone;
                contigous_count = contigous_count + 1;
            else
                are_contigous_zone = (last_zone.s1_final == (actual_zone.s1_start)) && ...
                    (last_zone.s2_final == (actual_zone.s2_start));
                is_valid_contigous_zone = contigous_count < max_windows_join;
                
                if (are_contigous_zone && is_valid_contigous_zone)
                    actual_zone.s1_start = last_zone.s1_start;
                    actual_zone.s2_start = last_zone.s2_start;
                    actual_zone.score = actual_zone.score + last_zone.score;
                    last_zone = actual_zone;
                    contigous_count = contigous_count + 1;
                else
                    organized_zones{length(organized_zones)}(zones_counter) = last_zone;
                    zones_counter = zones_counter + 1;
                    last_zone = actual_zone;
                    contigous_count = 1;
                end
            end
        end
    end
    organized_zones{length(organized_zones)}(zones_counter) = last_zone;
end
end

