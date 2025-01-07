clc;
close all;
clear all;

fc1 = 50; % Frequency of 1st Sine Wave carrier
fc2 = 20; % Frequency of 2nd Sine Wave carrier
fp = 5;  % Frequency of Periodic Binary pulse (Message)
amp = 5; % Amplitude (For Both Carrier & Binary Pulse Message)
t = 0:0.001:1; % Sampling interval

% For Generating 1st Carrier Sine wave
c1 = amp .* sin(2 * pi * fc1 * t);

% For Generating 2nd Carrier Sine wave
c2 = amp .* sin(2 * pi * fc2 * t);

subplot(4, 1, 1); % For Plotting The Carrier 1 Wave
plot(t, c1, 'b', 'LineWidth', 1.5); % Blue color for Carrier 1
xlabel('Time');
ylabel('Amplitude');
title('Carrier 1 Wave');
grid on;

subplot(4, 1, 2); % For Plotting The Carrier 2 Wave
plot(t, c2, 'r', 'LineWidth', 1.5); % Red color for Carrier 2
xlabel('Time');
ylabel('Amplitude');
title('Carrier 2 Wave');
grid on;

% For Generating Square wave message
m = amp / 2 * square(2 * pi * fp * t) + amp / 2;
subplot(4, 1, 3); % For Plotting The Square Binary Pulse (Message)
plot(t, m, 'g', 'LineWidth', 1.5); % Green color for Message Signal
ylim([0, amp]);
xlabel('Time');
ylabel('Amplitude');
title('Binary Message Pulses');
grid on;

for i = 1:length(t) % Generating the modulated wave
    if m(i) == 0
        fsk_signal(i) = c2(i);
    else
        fsk_signal(i) = c1(i);
    end
end

subplot(4, 1, 4); % For Plotting The Modulated FSK Wave
plot(t, fsk_signal, 'm', 'LineWidth', 1.5); % Magenta color for FSK Signal
xlabel('Time');
ylabel('Amplitude');
title('FSK Signal');
grid on;