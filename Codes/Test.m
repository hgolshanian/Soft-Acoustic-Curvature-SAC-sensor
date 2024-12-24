close all;


inputVarNames = {'VarName2', 'VarName3', 'VarName4', 'VarName5', 'VarName6', 'VarName7', 'VarName8', 'VarName9', 'VarName10', 'VarName11'};

Fs = 22050; % Reduced sample rate
L = 10000; % Window length
stepSize = 10000; % Increased step size for overlapping windows
recorder = audioDeviceReader('SampleRate', Fs, 'SamplesPerFrame', L);



% Record the start time
startTime = clock;
while etime(clock, startTime) < 500
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
        targetFrequencies = [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000];
        FFTValues = zeros(size(targetFrequencies));
        
        for i = 1:numel(targetFrequencies)
            targetFrequency = targetFrequencies(i);
            [~, index] = min(abs(M(:,1) - targetFrequency));
            FFTValues(i) = M(index, 2);
        end    
      
        
        FFT200 = FFTValues(1);
        FFT400 = FFTValues(2);
        FFT600 = FFTValues(3);
        FFT800 = FFTValues(4);
        FFT1000 = FFTValues(5);
        FFT1200 = FFTValues(6);
        FFT1400 = FFTValues(7);
        FFT1600 = FFTValues(8);
        FFT1800 = FFTValues(9);
        FFT2000 = FFTValues(10);

   
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

         data = table(FFT200, FFT400, FFT600, FFT800, FFT1000, FFT1200, FFT1400, FFT1600, FFT1800, FFT2000, 'VariableNames', inputVarNames);
Force = trainedModel15.predictFcn(data);
%Location = trainedModel.predictFcn(data);
Result = Force;
display (Result)
 % Move to the next window
        startIdx = startIdx + stepSize;
        endIdx = endIdx + stepSize;
    end
   
       %-------------------------------------
       

end