function str_out = xoa_khoang_trang_v2(str_in)
    str_out = []; %khoi tao
    for i = 1:length(str_in) %kich thuoc
        if str_in(i) ~= ' '
            str_out = [str_out, str_in(i)];
        end
    end
end