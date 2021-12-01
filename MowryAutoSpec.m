%time series analysis of mowry data


%figure out how to account for the empty spaces
mNewData = ;

%interpolate data to make it evenly spaced in time, without changing total
%# of data points.
vDistlin = linspace(min(vTime),max(vTime),length(vTime));
vInData = interp1(vTime, mNewData, vDistlin);

%detrend the data
vDtData = detrend(vInData);
dSamFreq = 1/(vDistlin(2) - vDistlin(1));

% produce the autospectrum
dNPT = 2^nextpow2(length(vInData)); 
[vPower, vFrequency] = periodogram(vDtData,[], dNPT, dSamFreq);

%plot and adjust the axis to show relevant information
figure('color', 'white')
    plot(vFrequency, vPower), grid
    dMaxPower = max(vPower);
    vHighPower = find(vPower >= dMaxPower/100);
    iLastHigh = vHighPower(end);
    dXLim = vFrequency(iLastHigh) + (0.1 * vFrequency(iLastHigh));
    xlim([0, dXLim]);
    xlabel('Frequency')
    ylabel('Power')
    title('Auto-Spectrum')