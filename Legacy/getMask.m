function Y=getMask(B40,XdB,m,Fn)
% Fn is frequency vector, Fo is center frequency, B40 is RSEC 40 dB bandwidth
% is the hopping bandwidth, -XdB is the maximum RSEC attenuation
% m is the rolloff slope in dB/decade (always positive)

Y = zeros(size(Fn));

fBWneg = -0.5 * B40;
fBWpos = 0.5 * B40;

for k=1:find(Fn<=fBWneg, 1, 'last' )
   Y(k)=-(m*log10(Fn(k)/fBWneg)+40);
   if Y(k)<-XdB
      Y(k)=-XdB;
   end
end

for k=find(Fn>=fBWpos, 1 ):length(Y)
   Y(k)=-(m*log10(Fn(k)/fBWpos)+40);
   if Y(k)<-XdB
      Y(k)=-XdB;
   end
end

return