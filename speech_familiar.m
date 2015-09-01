% A program for familirisation with speech processing 

clc;
close all;
clear all;
% reading a speech signal

[s,fs,nbits] = wavread('angry.wav');

% plotting wave forms with x-axis as time
len_s = length(s);
xval = linspace(0,1,len_s);
xval = xval*len_s/fs;
figure(1);
plot(xval,s);grid on;
title('speech signal');xlabel('time[seconds]');ylabel('amplitude');

% ploting spectogram of speech signal

framelen_samples = round((20/1000)*fs);
noverlap = 0.3* framelen_samples;
NFFT = 2^nextpow2(framelen_samples);
% figure(2);
% plot(hamming(framelen_samples));
figure(3)
spectrogram(s,hamming(framelen_samples),round(noverlap),NFFT,fs);
colorbar;

% plotting spectrum of particular coumn
SG = spectrogram(s,hamming(framelen_samples),round(noverlap),NFFT,fs);
spectrum = SG(:,178);
magnitude_spectrum = abs(spectrum);
magnitude_spectrum_dB = 20*log(magnitude_spectrum + eps);
% ploting frequency in x-axis
freqvaluesHz = ((0:NFFT/2)/(NFFT/2+1))*(fs/2);
figure(4);
plot(freqvaluesHz,magnitude_spectrum_dB)
title('Magnitude Spectrum');
xlabel('Frequency in Hz');ylabel('Magnitude in dB');
