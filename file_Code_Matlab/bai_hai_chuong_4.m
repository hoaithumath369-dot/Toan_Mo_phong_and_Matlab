x = input('nhap so x: ');
n = input('nhap so n: ');
temp = 0.0;
for i = 1:(n-1)
    temp = temp - (x.^(n*1))*((-1).^n);
end
fprintf('S = %.6f\n',temp);
clear all

