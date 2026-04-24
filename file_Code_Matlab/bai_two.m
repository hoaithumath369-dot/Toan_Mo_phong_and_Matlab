% --- 1. CẤU HÌNH COM PORT ---
portName = "COM3";       % Đảm bảo đúng cổng của bạn
baudRate = 115200; 

% Xóa các đối tượng COM cũ nếu vô tình bị kẹt từ lần chạy trước
delete(serialportfind); 

device = serialport(portName, baudRate, "Timeout", 5);
configureTerminator(device, "LF");
flush(device); 

% --- 2. TẠO GIAO DIỆN ĐỒ THỊ ---
fig = figure('Name', 'Mô phỏng Tăng dần', 'NumberTitle', 'off');
ax = axes('Parent', fig);
hLine = animatedline(ax, 'Color', 'b', 'LineWidth', 1.5, 'Marker', 'o'); 
title(ax, 'Biểu đồ Số thứ tự theo Thời gian thực');
xlabel(ax, 'Thời gian thực (Giây)');
ylabel(ax, 'Số thứ tự');
grid(ax, 'on');

disp("Đang vẽ đồ thị... Đóng cửa sổ đồ thị để dừng chương trình.");

% --- 3. VÒNG LẶP ĐỌC & VẼ LIÊN TỤC (AN TOÀN) ---
startTime = tic; 

try % BẮT ĐẦU BẪY LỖI
    while ishandle(fig) 
        if device.NumBytesAvailable > 0
            data = readline(device);
            data = strtrim(data); 
            
            if ~isempty(data) 
                parts = split(data); 
                
                if length(parts) >= 3
                    chuoiSieuNhan = parts(3); 
                    chuoiSo = erase(chuoiSieuNhan, "SieuNhan"); 
                    val = str2double(chuoiSo); 
                    
                    if ~isnan(val)
                        thoiGian = toc(startTime);
                        
                        % KIỂM TRA LẠI: Nếu đường vẽ hLine vẫn còn tồn tại thì mới vẽ
                        if isvalid(hLine) 
                            addpoints(hLine, thoiGian, val);
                            drawnow limitrate; 
                        end
                    end
                end
            end
        end
        % Thêm một khoảng nghỉ siêu nhỏ để MATLAB kịp nhận diện hành động đóng cửa sổ
        pause(0.01); 
    end
catch ME
    % Nếu có bất kỳ lỗi gì xảy ra, nó sẽ nhảy vào đây thay vì báo lỗi đỏ rực
    disp("Chương trình dừng do người dùng thao tác hoặc có lỗi xảy ra.");
end % KẾT THÚC BẪY LỖI

% --- 4. GIẢI PHÓNG TỰ ĐỘNG DÙ THÀNH CÔNG HAY THẤT BẠI ---
clear device;
disp("Đã ngắt kết nối COM an toàn. Bạn có thể chạy lại mã thoải mái!");