function str_outputs = chuyen_doi_char(str_inputs,mode,kt)
    str_outputs = [];
    if mode == 0
        str_outputs = hoa_to_thuongs(str_inputs)
    else
        str_outputs = thuong_to_hoas(str_inputs)
    end
    if kt ~= 0
        str_outputs = xoa_khoang_trangs(str_outputs)
    end
end

function str_out = xoa_khoang_trangs(str_in)
    str_out = []; %khoi tao
    for i = 1:length(str_in) %kich thuoc
        if str_in(i) ~= ' '
            str_out = [str_out, str_in(i)];
        end
    end
end

function [str_output] = hoa_to_thuong(str_input)
    str_output = []; %khoi tao
    for i = 1:length(str_input) %kich thuoc
        if (str_input(i)>=65 && str_input(i)<=90) %kiem tra chu hoa
            str_output = [str_output, str_input(i)+32]; %chuyen thanh chu thuong
        else
            str_output = [str_output, str_input(i)]; %noi ky tu tiep
        end
    end
end

function [str_output] = thuong_to_hoas(str_input)
    str_output = []; %khoi tao
    for i = 1:length(str_input) %kich thuoc
        if (str_input(i)>=97 && str_input(i)<=122) %kiem tra chu thuong
            str_output = [str_output, str_input(i)-32]; %chuyen thanh chu hoa
        else
            str_output = [str_output, str_input(i)];
        end
    end
end