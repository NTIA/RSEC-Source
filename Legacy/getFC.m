function Y=getFC(F,S)
%S must have max value 0 dB

[~,thrshld]=ginput(1);
t1=find(S>thrshld, 1 ,'first');
t2=find(S>thrshld, 1, 'last' );
Y=(F(t1)+F(t2))/2;

return