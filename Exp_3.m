clear;
close all;

% Input values for FM signal
Am = 1;  % Amplitude of the message signal
Ac = 1;  % Amplitude of the carrier signal
fm = 5;  % Frequency of the message signal (Hz)
fc = 50; % Frequency of the carrier signal (Hz)
t = 0:0.001:1; % Time vector from 0 to 1 second, with a step size of 0.001

% Modulation index B (assuming B = Am)
B = 5;  % Modulation index (scaled by the amplitude of the message signal)

% Equation for message signal
m = Am * sin(2 * pi * fm * t);

% Equation for carrier signal
c = Ac * sin(2 * pi * fc * t);

% Frequency modulated signal equation
y = Ac * sin(2 * pi * fc * t + B * sin(2 * pi * fm * t));

% Plotting the time-domain signals
subplot(4, 1, 1);
plot(t, m, 'g', 'LineWidth', 1.5); % Green color for message signal
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4, 1, 2);
plot(t, c, 'b', 'LineWidth', 1.5); % Blue color for carrier signal
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4, 1, 3);
plot(t, y, 'r', 'LineWidth', 1.5); % Red color for frequency modulated signal
title('Frequency Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Frequency Spectrum of FM Signal using FFT
N = length(y);                      % Length of the signal
Fs = 1000;                           % Sampling frequency (samples per second)
FM_spectrum = fft(y) / N;            % Normalized FFT of the signal
frequencies = (0:N/2-1) * Fs / N;    % One-sided frequency vector

% Plotting the Frequency Spectrum
subplot(4, 1, 4);
stem(frequencies, abs(FM_spectrum(1:N/2)), 'k', 'LineWidth', 1.5); % Black color for spectrum
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Spectrum of FM Signal');
grid on;

% Display the modulation index
fprintf('Modulation Index: %f\n', B);
