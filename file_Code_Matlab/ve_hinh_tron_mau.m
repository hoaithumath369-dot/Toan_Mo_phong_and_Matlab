xc = 3;       % Tọa độ tâm x
yc = 5;       % Tọa độ tâm y
r = 5;        % Bán kính
theta = 0:0.01:2*pi; % Tạo vector góc từ 0 đến 2*pi

% Tính toán tọa độ x và y
x = xc + r * cos(theta);
y = yc + r * sin(theta);

% Vẽ hình
plot(x, y, 'LineWidth', 2);
axis equal;       % Đảm bảo tỉ lệ trục x và y bằng nhau để đường tròn không bị méo
grid on;          % Bật lưới
title('Đường tròn trên mặt phẳng tọa độ');
xlabel('Trục X');
ylabel('Trục Y');
fill(x,y,'g ')
axis equal;