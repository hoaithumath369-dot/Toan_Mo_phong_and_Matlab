clear all
sv = [1;2;3;4;5]
diem = [6.25;7;8.50;9.75;10]
save('bai_nam.mat','diem','sv');
clear all;
load bai_nam.mat;
ds = [sv';diem'];
ds_temp = ds'

