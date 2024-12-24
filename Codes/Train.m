close all;
clear all;

% Prompt the user to enter an integer
userInteger = input('Enter curvature value: ');

Fs = 22050; % Reduced sample rate
L = 10000; % Window length
stepSize = 1000; % Increased step size for overlapping windows
recorder = audioDeviceReader('SampleRate', Fs, 'SamplesPerFrame', L);

% Create a cell array to store the results
results = cell(0, 11);

% Record the start time
startTime = clock;
while etime(clock, startTime) <15
    audioData = step(recorder);
    
    % Perform overlapping FFT
    startIdx = 1;
    endIdx = L;
    while endIdx <= length(audioData)
        windowData = audioData(startIdx:endIdx);
        
        % Perform FFT on the windowed data
        Fn = Fs/2;
        FTy = fft(windowData, L)/L;
        Fv = linspace(0, 1, fix(L/2)+1)*Fn;
        Iv = 1:numel(Fv);
        x = abs(FTy(Iv,:))*2;
        
        a = transpose(Fv);
        M(:,1) = a;
        M(:,2) = x;
        
        % Extract the FFT values at specific frequencies
       % targetFrequencies = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
       targetFrequencies = [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000];
        FFTValues = zeros(size(targetFrequencies));
        
        for i = 1:numel(targetFrequencies)
            targetFrequency = targetFrequencies(i);
            [~, index] = min(abs(M(:,1) - targetFrequency));
            FFTValues(i) = M(index, 2);
        end
        

   
        disp(targetFrequencies(1))
        disp(FFTValues(1))

        disp(targetFrequencies(2))
        disp(FFTValues(2))

        disp(targetFrequencies(3))
        disp(FFTValues(3))

        disp(targetFrequencies(4))
        disp(FFTValues(4))

         disp(targetFrequencies(5))
        disp(FFTValues(5))
        
        % Create a new row of results for the current iteration
        currentTime = datetime('now');
        newRow = {userInteger, FFTValues(1), FFTValues(2), FFTValues(3), FFTValues(4), FFTValues(5), FFTValues(6), FFTValues(7), FFTValues(8), FFTValues(9), FFTValues(10)};
        
        % Append the new row to the results cell array
        results = [results; newRow];
        
        % Move to the next window
        startIdx = startIdx + stepSize;
        endIdx = endIdx + stepSize;
    end
end

% Convert the cell array to a table
resultsTable = cell2table(results, 'VariableNames', {'Curvature', '200', '400', '600', '800', '1000','1200', '1400', '1600', '1800', '2000' });

% Write the results table to an Excel file
writetable(resultsTable, 'C.xlsx', 'Sheet', 1, 'WriteMode', 'append');

for i=1:11
for j = 1 : length(results),  w(j,i) = results{j,i}; end
end
figure
plot(w(:,2));
hold on
plot(w(:,3));
plot(w(:,4));
plot(w(:,5));
plot(w(:,6));
plot(w(:,7));
plot(w(:,8));
plot(w(:,9));
plot(w(:,10));
plot(w(:,11));


