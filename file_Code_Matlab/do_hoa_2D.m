% x = [1 5 5 1 1];
% y = [1 1 5 5 1];
% plot(x,y);
% axis([0 6 0 6]);
% axis equal

% Tạo mảng t (mình bỏ dấu ngoặc vuông [] đi vì trong trường hợp này không cần thiết, giúp code gọn hơn)
t = 0:0.01:4;

fx = exp(-2*t) .* sin(t);

% (Tùy chọn) Vẽ đồ thị để kiểm tra kết quả
figure;
plot(t, fx, 'b-', 'LineWidth', 2);
title('Đồ thị hàm số f(t)');
xlabel('Trục t');
ylabel('Trục f(t)');
grid on; % Bật lưới tọa độ cho dễ nhìn


