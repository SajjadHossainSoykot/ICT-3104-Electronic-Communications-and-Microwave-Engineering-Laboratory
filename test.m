clc;
clear;
close all;

% Parameters for the AM signal
Ac = 1;             % Carrier amplitude
Am = 1;             % Message amplitude
fc = 100;           % Carrier frequency (Hz)
fm = 10;            % Message frequency (Hz)
t = 0:0.001:1;      % Time vector
m = Am * sin(2*pi*fm*t);   % Original message signal
c = Ac * sin(2*pi*fc*t);   % Carrier signal

% AM signal (modulated signal)
y = Ac * (1 + 0.5 * sin(2*pi*fm*t)) .* sin(2*pi*fc*t); % AM signal

% Plot the AM signal
subplot(4,1,1);
plot(t, y, 'r', 'LineWidth', 1.5);
title('AM Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Diode detector (half-wave rectification)
y_rectified = abs(y); % Rectifying the AM signal

% Plot the rectified AM signal
subplot(4,1,2);
plot(t, y_rectified, 'b', 'LineWidth', 1.5);
title('Rectified AM Signal (Diode Detector)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% FIR filter (Envelope detection)
% Design a low-pass FIR filter
fs = 1 / (t(2) - t(1));       % Sampling frequency
fc_filter = 20;               % Cut-off frequency for low-pass filter (message frequency)
filter_order = 50;            % Filter order (higher order = sharper cutoff)

% Create FIR low-pass filter using the 'fir1' function
h = fir1(filter_order, fc_filter / (fs / 2));  % Normalized cut-off frequency

% Apply the FIR filter to the rectified signal
y_demodulated = filter(h, 1, y_rectified);

% Plot the demodulated signal
subplot(4,1,3);
plot(t, y_demodulated, 'g', 'LineWidth', 1.5);
title('Demodulated Signal (FIR Filter Envelope Detection)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the original message signal for comparison
subplot(4,1,4);
plot(t, m, 'k', 'LineWidth', 1.5);
title('Original Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
