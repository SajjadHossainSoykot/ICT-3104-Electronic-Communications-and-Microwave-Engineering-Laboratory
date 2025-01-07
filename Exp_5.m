clc;
close all;

% Input values
Am = 1;      % Amplitude of message signal
Ac = 1;      % Amplitude of carrier signal
fm = 4;      % Frequency of message signal (fm < fc)
fc = 40;     % Frequency of carrier signal
B = 5;       % Modulation index
t = 0:0.001:1; % Time vector from 0 to 1 second with a step size of 0.001

% Equation for the message signal
y1 = Am * sin(2 * pi * fm * t);
subplot(3, 1, 1);
plot(t, y1, 'blue', 'LineWidth', 1);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Equation for the carrier signal
y2 = Ac * sin(2 * pi * fc * t);
subplot(3, 1, 2);
plot(t, y2, 'magenta', 'LineWidth', 1);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Equation for the FM modulated signal
y = Ac * sin(2 * pi * fc * t + B * sin(2 * pi * fm * t));
subplot(3, 1, 3);
plot(t, y, 'red', 'LineWidth', 1);
title('FM Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;