[yC, Fs] = audioread("C.wav");
[yG, Fs] = audioread("G.wav");
[yB, Fs] = audioread("B.wav");
[yE, Fs] = audioread("E.wav");

% Combine the audio signals into a single matrix for playback
combinedAudio = [yC; yG; yB; yE];
sound(combinedAudio, Fs);

% Perform FFT on each audio signal and store the results
fftC = fft(yC);
fftG = fft(yG);
fftB = fft(yB);
fftE = fft(yE);

CG = fftC + fftG; 
CB = fftC + fftB; 
CE = fftC + fftE; 

% Perform the inverse FFT to obtain the time-domain signal
iffCG = ifft(CG);
iffCB = ifft(CB);
iffCE = ifft(CE);

% Normalize the result for playback
iffCG_norm = iffCG / max(abs(iffCG));
iffCB_norm = iffCB / max(abs(iffCB));
iffCE_norm = iffCE / max(abs(iffCE));
sound(iffCG_norm,Fs)
sound(iffCB_norm,Fs)
sound(iffCE_norm,Fs)

% e minor chord 2nd inversion 
eMinor = fftG + fftB + fftE;
iffEMinor = ifft(eMinor);
iffEMinor_norm = iffEMinor / max(abs(iffEMinor));
sound(iffEMinor_norm, Fs);

% c major 7 
cMaj7 = fftC + eMinor; 
iffCMaj7 = ifft(cMaj7);
iffCMaj7_norm = iffCMaj7 / max(abs(iffCMaj7));
sound(iffCMaj7_norm, Fs);
