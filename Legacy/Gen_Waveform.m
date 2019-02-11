function  Gen_Waveform(Bc,Tr,Tf,tau)
Fs = Bc * 2; % Default Span Setting
PRR = 1000; % Default value
dc = tau * PRR * 1e-6;
dc = checkdc(dc,Fs,tau,Tr,Tf);

[X,Y] = Gen_Trap_Spect(0,Bc,tau,Tr,Tf,dc,Fs);

plot(X,Y)

return

function y=checkdc(dc,Fs,tau,dr,df)
tb=tau + .5*(dr+df);
dt=1/Fs;    
t = -tb/2:dt:tb/2-dt;
M=length(t);
N=ceil(M/dc);
th=5e6;
if N>th
   y=M/th;
else
   y=dc;
end

function [f,SdB] = Gen_Trap_Spect(fc,Bc,tau,dr,df,dc,Fs)
% FFT of trapezoidal pulse
% Calculate the spectrum of a complex trapezoidal chirp.  Plot the power spectrum
% Bc is zero for un-modulated pulse
tb=tau + .5*(dr+df);  %pulse width at the base.  Chirp occurs over this width
dt=1/Fs;    

t = -tb/2:dt:tb/2-dt;   %time for pulse
M=length(t);

A=ones(1,M);    %Create pulse envelope

cc=floor(dr/dt+1);
A(1:cc)=t(1:cc)/dr+0.5*tb/dr;
dd=ceil((tb-df)*Fs)+1;%ceil(df/dt-1);
A(dd:end)=-t(dd:end)/df+0.5*tb/df;

N=ceil(M/dc);%2^16; %# FFT points

x = A.*exp(1i*(2*pi*(fc*t+Bc*(t.^2)/(2*tb))));
   
SdB = 20*log10(abs(fftshift(fft(x,N)))); %This is a FFT shifted
dFf=Fs/N;    
f = -Fs/2:dFf:+Fs/2-dFf;%-.5*N/dFf:.5*N/dFf-1;     % frequency scale, Hz

return




