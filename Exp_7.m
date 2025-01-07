clc;
close all;
clear all;

t = 0:0.01:5;      % Time vector
d = 0:1/5:5;       % Pulse positions (for pulse carrier)
fm = 1;             % Message signal frequency

% Message Signal...
x = 5 * sin(2 * pi * fm * t);
subplot(3, 1, 1);
plot(t, x, 'b', 'LineWidth', 1.5);  % Blue color, LineWidth 1.5
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Pulse Carrier...
y = pulstran(t, d, 'rectpuls', 0.1);
subplot(3, 1, 2);
plot(t, y, 'm', 'LineWidth', 1.5);  % Magenta color, LineWidth 1.5
title('Pulse Carrier');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Pulse Amplitude Modulation Output...
z = x .* y;
subplot(3, 1, 3);
plot(t, z, 'r', 'LineWidth', 1.5);  % Red color, LineWidth 1.5
title('PAM Modulation (Natural PAM)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;