function y = mysort(x)
    n = length(x);
    for i = 1:(n-1)
        for j = 1:(n-i)
            if x(j) > x(j+1)
                % Thực hiện đổi chỗ hai phần tử
                tam = x(j);      % Bước 1: Lưu tạm giá trị của x(j) vào biến tam
                x(j) = x(j+1);   % Bước 2: Gán giá trị của x(j+1) đè lên x(j)
                x(j+1) = tam;   % Bước 3: Đưa giá trị ban đầu của x(j) từ biến tam vào x(j+1)
            end
        end
    end
    y = x
end