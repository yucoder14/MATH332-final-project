% Reads audio 
[y, Fs] = audioread("Cmaj7.wav");

% duration of each audio segment 
segmentLength = 80; 

% number of samples per segment
samplesPerSegment = segmentLength * Fs; 

% total segments 
numSegments = ceil(length(y) / samplesPerSegment); 

for k = 1:numSegments 
    % index range for segment 
    startIdx = (k-1) * samplesPerSegment + 1;
    endIdx = min(k * samplesPerSegment, length(y));

    % extract segment
    segment = y(startIdx:endIdx);

    % time domain plot
    t = (0:length(segment)-1 / Fs);
    figure;
    subplot(2, 1, 1);
    plot(t, segment);
    xlabel('Time (s)');
    ylabel('Amplitude (dB)');
    title(['Segment ', num2str(k), ' (', num2str((k-1)*10), '-', num2str(min(k*10, length(y)/Fs)), ' sec)']);
    grid on;

    % FFT computation 
    N = length(segment); % number of samples
    Y = fft(segment); % fft
    Ymag = abs(Y) / N; % normalized
    f = (0:N-1) * (Fs/N); % frequency axis
    
    % limit frequency range from 20 to 10000Hz
    freqRange = (f >= 20 & f <= 800);
    f = f(freqRange);
    Ymag = Ymag(freqRange);

    % plot positive frequencies only 
    pos = 1:floor(N/2);

    subplot(2, 1, 2);
    plot(f, Ymag);
    xlabel('Frequency (Hz)');
    ylabel(['FFT Magnitude: Segment ', num2str(k)]);
    grid on; 
end



% create time axis 
% t = (0:length(y) -1) / Fs;

% Plot audio file
% figure;
% plot(t, y, 'Color', 'cyan');
% xlabel('Time (s)');
% ylabel('Amplitude (dB)');
% title('Amplitude vs Time');
% grid on; 
