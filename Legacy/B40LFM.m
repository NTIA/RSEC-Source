function B=B40LFM(Bc,t,tr,tf,n)
% Function to Create -40 dB Pulsed FM Radar Mask
% t = 50% voltage pulse width
% Bc = chirp bandwidth
% tr = rise time (10% - 90%) 
% tf = fall time (90% - 10%) 
% n  = implementation factor (number greater than 1)
% B = -40 dB bandwidth

dr=1.25*tr;
df=1.25*tf;
tb=t+0.5*(dr+df);
bt=Bc*tb;
Brise=1/sqrt(tb*dr);
Bfall=1/sqrt(tb*df);
Brf=1/(tb*df*dr)^(1/3);
Bvec=[Brise Bfall Brf]; 

if bt>10 && Bc*min(dr,df)>0.1
   B=n*Bc+n*sqrt(pi)*(log(bt)^0.53)*(min(Bvec)+max(Bvec));
else
   B=((7.6/sqrt(2*t*1e-6*tr*1e-6)+ 2 * (Bc*1e6+(0.065/(tr*1e-6))))/1e6);
end