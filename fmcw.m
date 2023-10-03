%% S24-41 MDE FMCW simulation
% created by allison 10/03/2023
% edited by: (^-^)
clc, clear all

fc = 5*10^3;                        % center freq
BW = 1*10^3;                        % bandwidth
n = 2*(fc+BW);                            % incrementing variable
fRange = linspace(fc-BW, fc+BW, n); % range of pulse
slope = 1;                          % slope of pulse in freq domain
A = 1;                              % amplitude of pulse
t = linspace(0, 0.01, n);        % time vector

pulse_t = zeros(1, n);
for i = 1:n
  pulse_t(i) = A*cos(fRange(i)*t(i));
end

pulse_f = fft(pulse_t);

plot(t, pulse_t)
xlabel('time (s)')
ylabel('signal in time domain')

