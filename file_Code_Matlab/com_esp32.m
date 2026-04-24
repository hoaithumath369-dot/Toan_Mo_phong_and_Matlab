% Clear workspace and close old figures
clear; clc; close all;

% --- CONFIGURATION ---
% Change 'COM3' to the actual COM port of your ESP32
comPort = 'COM3'; 
baudRate = 115200;

% 1. Create a serial port object
try
    s = serialport(comPort, baudRate);
    configureTerminator(s, "LF"); % Read until Line Feed (\n)
    flush(s); % Clear old data in the buffer
    disp('Successfully connected to ESP32!');
catch
    error('Could not open COM Port. Please close Arduino Serial Monitor!');
end

% 2. Setup the Figure for Live Plotting
fig = figure('Name', 'Real-Time Health Monitor', 'NumberTitle', 'off');

% Subplot 1: Heart Rate
ax1 = subplot(2, 1, 1);
h1 = animatedline(ax1, 'Color', 'r', 'LineWidth', 2);
title(ax1, 'Heart Rate (BPM)');
ylabel(ax1, 'BPM');
grid(ax1, 'on');

% Subplot 2: SPO2
ax2 = subplot(2, 1, 2);
h2 = animatedline(ax2, 'Color', 'b', 'LineWidth', 2);
title(ax2, 'SPO2 (%)');
ylabel(ax2, 'Percentage');
grid(ax2, 'on');

disp('Waiting for sensor data... Press Ctrl+C in Command Window to stop.');

% 3. Start reading and plotting loop
tic; % Start a timer for the X-axis
while ishandle(fig) % Run as long as the figure window is open
    try
        % Read a line of data from ESP32
        dataStr = readline(s);
        
        % Convert string "85,98" to a numeric array [85, 98]
        dataArray = str2double(split(dataStr, ','));
        
        % Check if the data is valid (must have exactly 2 numbers)
        if length(dataArray) == 2 && ~any(isnan(dataArray))
            currentTime = toc; % Get current elapsed time
            hr = dataArray(1);
            spo2 = dataArray(2);
            
            % Add new points to the graphs
            addpoints(h1, currentTime, hr);
            addpoints(h2, currentTime, spo2);
            
            % Update X-axis limits to create a "scrolling" effect (showing last 20 seconds)
            ax1.XLim = [max(0, currentTime - 20), max(20, currentTime + 5)];
            ax2.XLim = [max(0, currentTime - 20), max(20, currentTime + 5)];
            
            % Force MATLAB to draw the update immediately
            drawnow;
        end
    catch
        % Ignore incomplete lines or transmission noise
    end
end

% Clean up when the window is closed
clear s;
disp('Connection closed.');

