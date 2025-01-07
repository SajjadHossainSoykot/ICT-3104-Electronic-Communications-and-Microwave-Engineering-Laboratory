clc;
close all;
clear;

% User Inputs
Am = input('Enter message signal amplitude (Am): ');  % Amplitude of the message signal
Ac = input('Enter carrier signal amplitude (Ac): ');  % Amplitude of the carrier signal
fm = input('Enter message frequency (fm, in Hz): ');  % Frequency of the message signal (fm < fc)
fc = input('Enter carrier frequency (fc, in Hz): ');  % Frequency of the carrier signal

if fm >= fc
    error('Message frequency (fm) must be less than carrier frequency (fc).');
end

% Calculate Modulation Index
m = Am / Ac;  % Modulation index (m <= 1)

% Time Vector
t = 0:0.001:1;  % Time vector from 0 to 1 second with a step of 0.001s

% Message Signal
message_signal = Am * sin(2 * pi * fm * t);  % m(t) = Am * sin(2?fmt)
subplot(3, 1, 1);
plot(t, message_signal, 'b', 'LineWidth', 1.5);
title('Message Signal (m(t))');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Carrier Signal
carrier_signal = Ac * sin(2 * pi * fc * t);  % c(t) = Ac * sin(2?fct)
subplot(3, 1, 2);
plot(t, carrier_signal, 'm', 'LineWidth', 1.5);
title('Carrier Signal (c(t))');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% AM Signal
am_signal = Ac * (1 + m * sin(2 * pi * fm * t)) .* sin(2 * pi * fc * t);  % s(t)
subplot(3, 1, 3);
plot(t, am_signal, 'r', 'LineWidth', 1.5);
title('Amplitude Modulated Signal (s(t))');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Display Modulation Index
fprintf('Modulation Index (m): %.2f\n', m);