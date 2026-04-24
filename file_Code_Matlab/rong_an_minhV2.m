clear all %xóa các biến 
% Khởi tạo ma trận A kích thước 10x3
% Cột 1 (L): [2, 8], Cột 2 (W): [5, 15], Cột 3 (M): [50, 100]
L = 2 + (8 - 2) .* rand(10, 1);
W = 5 + (15 - 5) .* rand(10, 1);
M = 50 + (100 - 50) .* rand(10, 1);
A = [L, W, M];

% --- Câu a: Phân loại sản phẩm ---
% Điều kiện loại A
is_A = (A(:,1) >= 3 & A(:,1) <= 7) & ...
       (A(:,2) >= 6 & A(:,2) <= 12) & ...
       (A(:,3) >= 60 & A(:,3) <= 90);

% Điều kiện loại B (nằm trong khoảng B và không thuộc A)
is_B_range = (A(:,1) >= 2.5 & A(:,1) <= 7.5) & ...
             (A(:,2) >= 5.5 & A(:,2) <= 14) & ...
             (A(:,3) >= 55 & A(:,3) <= 95);
is_B = is_B_range & ~is_A;

% Điều kiện loại C (còn lại)
is_C = ~is_A & ~is_B;

% Khởi tạo các ma trận con
A_A = A(is_A, :);
A_B = A(is_B, :);
A_C = A(is_C, :);

% --- Câu b: In danh sách sản phẩm loại B ---
fprintf('Danh sach san pham loai B:\n');
fprintf('**********\n');
fprintf('STT\t\tL\tW\tM\n');
if isempty(A_B)
    fprintf('Khong co san pham loai B\n');
else
    for i = 1:size(A_B, 1)
        fprintf('%d    %.2f   %.2f   %.2f\n', i, A_B(i,1), A_B(i,2), A_B(i,3));
    end 
end
fprintf('\n');

% --- Câu c: Tìm sản phẩm có khối lượng M lớn nhất và nhỏ nhất ---
[maxM, maxIdx] = max(A(:, 3));
[minM, minIdx] = min(A(:, 3));

fprintf('San pham co khoi luong lon nhat:\n');
fprintf('L= %.2f, W= %.2f, M= %.2f\n', A(maxIdx,1), A(maxIdx,2), A(maxIdx,3));

fprintf('San pham co khoi luong nho nhat:\n');
fprintf('L= %.2f, W= %.2f, M= %.2f\n', A(minIdx,1), A(minIdx,2), A(minIdx,3));




