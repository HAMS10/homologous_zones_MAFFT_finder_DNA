function [compare_value] = compare_nucleotides(nt_1, nt_2)
    global PAM200
    global base_index
    row_index = base_index(nt_1);
    column_index = base_index(nt_2);
    compare_value = PAM200(row_index, column_index);
end

