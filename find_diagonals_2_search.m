function [k] = find_diagonals_2_search(c_k, number_of_zones)
    zone_index = 1: length(c_k);
    local_peaks = find_all_local_max_index(c_k(zone_index));
    peaks_values = zeros(length(local_peaks), 1);
    peaks_values = c_k(local_peaks(:));
    [values, index] = sort(peaks_values, 'descend');
    if length(local_peaks) < number_of_zones
        k = local_peaks;
    else
        k = local_peaks(index(1:number_of_zones));
    end
    k = sort(k);
end

