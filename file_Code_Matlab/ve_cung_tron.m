clc; clear; close all;

r_min = input('Nhap ban kinh nho nhat: ');
n = input('Nhap so vong: ');
R = r_min * n;

theta = linspace(0, pi, 200);
hold on;

for i = 1:n
    r1 = R*(n-i+1)/n;
    r2 = R*(n-i)/n;
    
    x = [r1*cos(theta) r2*cos(theta)];
    y = [r1*sin(theta) r2*sin(theta)];
    
    fill(x, y, rand(1,3), 'EdgeColor','k');
end
axis equal;
grid on;