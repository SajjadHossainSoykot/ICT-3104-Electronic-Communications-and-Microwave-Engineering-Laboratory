clc;
close all;
clear all;

fc = 20; % Frequency of Sine Wave carrier
fp = 4;  % Frequency of Periodic Binary pulse (Message)
amp = 5; % Amplitude (For Carrier & Binary Pulse Message)
t = 0:0.001:1; % Sampling interval

% For Generating Square wave message
m = amp / 2 * square(2 * pi * fp * t) + (amp / 2);
subplot(3, 1, 1);
plot(t, m, 'm', 'LineWidth', 1.5); % Magenta color for Binary Message
xlabel('Time');
ylabel('Amplitude');
title('Binary Message Pulses');
grid on;

% For Generating Carrier Sine wave
c = amp * sin(2 * pi * fc * t);
subplot(3, 1, 2);
plot(t, c, 'b', 'LineWidth', 1.5); % Blue color for Carrier Wave
xlabel('Time');
ylabel('Amplitude');
title('Carrier Wave');
grid on;

% The Shift Keyed Wave
ask = c .* m;
subplot(3, 1, 3); % For Plotting The Amplitude Shift Keyed Wave
plot(t, ask, 'r', 'LineWidth', 1.5); % Red color for ASK Signal
xlabel('Time');
ylabel('Amplitude');
title('Amplitude Shifted Key Signal');
grid on;