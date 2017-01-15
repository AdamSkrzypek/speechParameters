

function [discreteCosineTransform ] = cepstralAnalysis(signal, fs)
    filterWidthMel = 300;
    filterCount = 20;
    fourier = abs(fft(signal));
    figure(1);
    
    fourierHalfSize = round(size(fourier,2)/2)
    
    fourierHalf = fourier(1:fourierHalfSize)
    yyaxis left
    subplot(4,1,1);
    plot(fourierHalf);
     title('spectrum');
     
    subplot(4,1,2);
    title('filters');
    hold on;
    yyaxis right
    for i = [1:filterCount]
       melFilterWindow = generateMelFilterWindow(i, filterWidthMel, fs/2, size(fourierHalf,2));
       plot (melFilterWindow,'-c');
       energy(i) = sum(fourierHalf .* melFilterWindow)^2;
    end
    
    hold off;
    
    subplot(4,1,3);
    bar(energy);
    title('energy in each filter');
    
    subplot(4,1,4);
    discreteCosineTransform = dct(energy);
    bar(discreteCosineTransform );
    title('discrete cosine transform');
end