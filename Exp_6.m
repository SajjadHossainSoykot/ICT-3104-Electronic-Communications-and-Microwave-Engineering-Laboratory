clc;
close all;
clear all;

% Parameters for the AM signal
Am = 1;      % Amplitude of the message signal
Ac = 5;      % Amplitude of the carrier signal
fm = 10;     % Frequency of the message signal
fc = 100;    % Frequency of the carrier signal
t = 0:0.001:1; % Time vector

% Modulated AM signal (using modulation index m = 1)
m = Ac * (1 + Am / Ac * sin(2 * pi * fm * t)) .* sin(2 * pi * fc * t);

subplot(4, 1, 1);
plot(t, m, 'r', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('AM Modulated Signal');
grid on;

% Diode detector (half-wave rectification)
rectified_signal = abs(m);

subplot(4, 1, 2);
plot(t, rectified_signal, 'g', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Rectified Signal');
grid on;

% Low-pass filter to extract the message signal
% Design a simple low-pass filter using a simple moving average filter
Fs = 1000;      % Sampling frequency
cutoff = fm * 2; % Cutoff frequency for the low-pass filter (twice the message frequency)
[b, a] = butter(6, cutoff / (Fs / 2)); % 6th order Butterworth filter
demodulated_signal = filter(b, a, rectified_signal);

subplot(4, 1, 3);
plot(t, demodulated_signal, 'b', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Demodulated Signal (Message)');
grid on;

% The original message signal for comparison
original_message = Am * sin(2 * pi * fm * t);
subplot(4, 1, 4);
plot(t, original_message, 'm', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Message Signal');
grid on;

% Display the modulation index
fprintf('Message signal frequency: %f Hz\n', fm);
fprintf('Carrier signal frequency: %f Hz\n', fc);
