function [str_output] = hoa_to_thuong(str_input)
    str_output = []; %khoi tao
    for i = 1:length(str_input) %kich thuoc
        if (str_input(i)>=65 && str_input(i)<=90) %kiem tra chu hoa
            str_output = [str_output, double(str_input(i))+32]; %chuyen thanh chu thuong
        elseif str_input(i) ~= ' '
            str_output = [str_output, str_input(i)]; %noi ky tu tiep
        end
    end
end