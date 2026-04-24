function chuoi_dau_ra = thay_ky_tu(str_in)
    chuoi_dau_ra = []; %khoi tao
    for i = 1:length(str_in) %kich thuoc 
        if str_in(i) == ' '
            chuoi_dau_ra = [chuoi_dau_ra, '*'];
        else
            chuoi_dau_ra = [chuoi_dau_ra, str_in(i)];
        end
    end
end
