clear all;
R = 5;
theta = linspace(0, 2*pi, 1000);
x = 3 + R*cos(theta);
y = 4 + R*sin(theta);
figure;
plot(x, y, 'b');
new_width = 400;
new_height = 400;

set(gca, 'Position', [current_pos(1), current_pos(2), new_width, new_height]);


