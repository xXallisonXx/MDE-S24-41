%% S24-41 MDE Transmit pulse simulation 
% created by allison 11/02/2023
% edited by: (^-^)

clc, clear
% speed of light
c = 3*10^8;
% max unambiguous range
Rmax = 10; % meters
% time delay multiplier between pulses
x = 100;

%% Antenna info
% patch antenna gain
txGain = 9; % dBi
% tx power
txPwr = 1;  % Watt

%% Generating FMCW waveform
% center frequency
fc = 5*10^9;
% pulse bandwidth (frequency)
bw = 1*10^9;
% samp rate
fs = 22000000000; % 2*(fc + 0.5*bw), type mismatch error lol
% sweep shape
shape = 'Triangle';
% pulsewidth (time)
pw = 1*10^-7; % 2*Rmax/((x - 1)*c) ~1ns didn't work? too small?
% only models one waveform for now
sig = phased.FMCWWaveform('SampleRate', fs, ...
    'SweepTime', pw, ...
    'SweepBandwidth', bw, ...
    'SweepDirection', 'Triangle', ...
    'NumSweeps', 2);
sig = step(sig);
t = linspace(0, pw, length(sig));

plot(t, real(sig))

% windowlength = 64;
% noverlap = 32;
% nfft = 64;
% spectrogram(sig,windowlength,noverlap,nfft,fs,'yaxis')
