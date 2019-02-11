 


Fs = 1000;
    t = 0:1/Fs:1-1/Fs;
    x = cos(2*pi*100*t)+randn(size(t));
    [Pxx,F] = periodogram(x,[],length(x),Fs);
    plot(F,10*log10(Pxx))