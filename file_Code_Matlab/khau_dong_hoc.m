clc; clear; close all;

%% --- Thông số ---
AB  = 0.5;          % m
BC  = 1.0;          % m
phi = 45;           % độ (góc khâu 1)

phi_rad = deg2rad(phi);

%% --- Tính toán động học ---
% Điểm A (gốc cố định)
Ax = 0; Ay = 0;

% Điểm B
Bx = AB * cos(phi_rad);
By = AB * sin(phi_rad);

% Điểm C (con trượt, Cy = 0)
% BC^2 = (Cx-Bx)^2 + (0-By)^2
Cx = Bx + sqrt(BC^2 - By^2);
Cy = 0;

% Góc khâu 2 (BC) với phương ngang
beta_rad = atan2(Cy - By, Cx - Bx);
beta     = rad2deg(beta_rad);

%% --- In kết quả ---
fprintf('=== KẾT QUẢ ===\n');
fprintf('Góc φ  = %.1f°\n', phi);
fprintf('B = (%.4f, %.4f) m\n', Bx, By);
fprintf('C = (%.4f, %.4f) m\n', Cx, Cy);
fprintf('Góc khâu 2 (BC) với ngang = %.2f°\n', beta);

%% --- Vẽ cơ cấu ---
figure('Color','white','Position',[100 100 800 500]);
hold on; axis equal; grid on;

% Trục
xlim([-0.3, 1.6]); ylim([-0.3, 0.8]);
xlabel('x (m)'); ylabel('y (m)');
title(sprintf('Cơ cấu tay quay con trượt | φ = %.0f°, β = %.2f°', phi, beta), ...
      'FontSize', 13);

% Đường tâm ngang (dash-dot)
plot([-0.3 1.6], [0 0], 'k-.', 'LineWidth', 1);

% Khâu 1: AB (màu đỏ)
plot([Ax Bx], [Ay By], 'r-o', 'LineWidth', 3, ...
     'MarkerSize', 8, 'MarkerFaceColor', 'r');

% Khâu 2: BC (màu xanh)
plot([Bx Cx], [By Cy], 'b-o', 'LineWidth', 3, ...
     'MarkerSize', 8, 'MarkerFaceColor', 'b');

% Khớp A (tam giác cố định)
plot(Ax, Ay, 'k^', 'MarkerSize', 14, 'MarkerFaceColor', 'k');

% Khớp B (vòng tròn)
plot(Bx, By, 'ko', 'MarkerSize', 12, 'LineWidth', 2);

% Con trượt C (hình vuông)
rectangle('Position', [Cx-0.04, Cy-0.04, 0.08, 0.08], ...
          'EdgeColor', 'k', 'LineWidth', 2);
plot(Cx, Cy, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'w', 'LineWidth', 2);

% Góc phi (cung tròn)
theta_arc = linspace(0, phi_rad, 50);
r_arc = 0.12;
plot(r_arc*cos(theta_arc), r_arc*sin(theta_arc), 'k-', 'LineWidth', 1.5);
text(0.14, 0.05, '\phi', 'FontSize', 13, 'Color', 'k');

% Nhãn điểm
text(Ax-0.08, Ay+0.05, 'A', 'FontSize', 13, 'FontWeight', 'bold');
text(Bx+0.02, By+0.04, 'B', 'FontSize', 13, 'FontWeight', 'bold');
text(Cx+0.04, Cy+0.05, 'C', 'FontSize', 13, 'FontWeight', 'bold');

% Nhãn khâu
text((Ax+Bx)/2 - 0.1, (Ay+By)/2, '1', 'FontSize', 12, 'Color', 'r');
text((Bx+Cx)/2,       (By+Cy)/2 + 0.05, '2', 'FontSize', 12, 'Color', 'b');

% Con trượt nhãn
text(Cx+0.06, Cy-0.05, '3', 'FontSize', 12);

legend('Trục ngang','Khâu 1 (AB)','Khâu 2 (BC)', ...
       'Location','northwest','FontSize',10);

hold off;