signal= sin([0:0.4:200]).*sin([0:0.1:50]/3.1).*[0:0.01:5.0];
Fs=48000;

%plotEnvelope(signal,Fs);
plotZeroCrossDensity(signal,Fs);    