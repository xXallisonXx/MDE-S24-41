%{
radar chirp generates samples of a sine wave that increases and then decreases
in frequency. In other words it generates triangle spectrogram signals

inputs 
t : a vector of sample times
freqLow : the minimum frequency of the sin wave
freqHigh : the max frequency of the sine wave
numTriangles : number of triangles that should be visible in spectrogram
over the provided sample times

outputs
y : a time domain vector of the signal at each time instant
freq : a time domain vector of the instantanous frequency at each time
instant
theta : a time domain vecotor of the phase at each time instant.
%}
function [y,freq, theta] = radarSawtoothChirp(t, freqLow, freqHigh, numTriangles)
y = zeros(length(t), 1);
freq = zeros(length(t), 1);
theta = zeros(length(t), 1);
samplesPerTriangle = length(t) / numTriangles;
for k = 1 : length(t);
    x = mod(k / samplesPerTriangle, 1);
    freq(k) = (freqHigh-freqLow)*x + freqLow;
end
theta = cumtrapz(t, 2*pi*freq);
y = exp(1i*theta);
end