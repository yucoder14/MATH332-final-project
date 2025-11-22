% Reads audio 
[y, Fs] = audioread("/Users/avivasachs/Desktop/birdsounds.m4a");

% convert to mono
if size(y,2) == 2
    y = mean(y,2);
end

% spectrogram parameters
windowLengthSec = 1;
windowSamples = windowLengthSec * Fs;
overlap = floor(windowSamples * 0.75);
Nfft = 2^nextpow2(windowSamples);



% spectrogram 
figure;
spectrogram(y, windowSamples, overlap, Nfft, Fs, 'yaxis');
title('High Resolution Spectrogram');
xlabel('Time (s)');
ylabel('Frenquency (Hz)');
colorbar;
