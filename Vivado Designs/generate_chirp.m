% Parameters for the chirp signal
fs = 655350;         % Sampling frequency (0.5 MHz) half of Fs
t = 0:1/fs:0.1;               % Time vector (2 seconds)
f0 = 0;           % Starting frequency (1 MHz)
f1 = 163837.5;           % Ending frequency (3 MHz)

% Generate the chirp signals for I and Q channels
chirp_signal_I = chirp(t, f0, t(end), f1, 'linear');
chirp_signal_Q = chirp(t, f0, t(end), f1, 'linear', -180); % 90-degree phase shift for Q channel

% Combine the signals to form a complex signal
complex_signal = chirp_signal_I + 1i * chirp_signal_Q;

% Plot the real and imaginary parts of the complex signal (optional)
subplot(3,1,1);
plot(t, real(complex_signal));
xlabel('Time (s)');
ylabel('Amplitude');
title('Real Part (I)');

subplot(3,1,2);
plot(t, imag(complex_signal));
xlabel('Time (s)');
ylabel('Amplitude');
title('Imaginary Part (Q)');

subplot(3,1,3);
plot(complex_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Imaginary Part (Q)');

% Save the complex signal to a .mat file
save('complex_chirp_signal_131072_samples_NEG180_PHASE.mat', 'fs', 'complex_signal');

