function str_ket_qua = xoa_khoang_trang(str_dau_vao)
    str_ket_qua = ''; 
    % Đếm xem chuỗi đầu vào có bao nhiêu ký tự
    n = length(str_dau_vao);
    % Duyệt qua từng ký tự trong chuỗi
    for i = 1:n
        % Kiểm tra: Ký tự hiện tại có KHÁC khoảng trắng không?
        % Dấu ~= trong MATLAB có nghĩa là "Không bằng" (Khác)
        if str_dau_vao(i) ~= ' '
            % Nếu không phải khoảng trắng, ta nối ký tự đó vào cuối chuỗi kết quả
            % Cú pháp [A, B] dùng để ghép nối (nối tiếp) trong MATLAB
            str_ket_qua = [str_ket_qua, str_dau_vao(i)];
        end
    end
end

