clc;
close all;
clear;

% Parameters
Fs = 1000;                % Sampling frequency (Hz)
T = 1;                    % Signal duration (seconds)
t = 0:0.001:1;        % Time vector
fc = 100;                 % Carrier frequency (Hz)
fm = 5;                   % Message frequency (Hz)
Am = 1;                   % Amplitude of the message signal

% Generate Signals
carrier_signal = cos(2 * pi * fc * t);          % Carrier signal
message_signal = Am * sin(2 * pi * fm * t);     % Message signal
AM_signal = (1 + message_signal) .* carrier_signal; % AM signal

% Plot Time Domain Signals
subplot(2, 1, 1);
plot(t, AM_signal, 'b', 'LineWidth', 1);
xlabel('Time (s)');
ylabel('Amplitude');
title('AM Signal in Time Domain');
grid on;

% Frequency Spectrum
N = length(AM_signal);                  % Number of samples
AM_spectrum = fft(AM_signal) / N;       % Normalized FFT
frequencies = (0:N/2-1) * Fs / N;       % One-sided frequency vector

% Plot Frequency Spectrum
subplot(2, 1, 2);
stem(frequencies, abs(AM_spectrum(1:N/2)), 'r', 'LineWidth', 1);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('AM Signal Spectrum');
grid on;