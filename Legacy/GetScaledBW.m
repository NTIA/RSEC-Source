function Y = GetScaledBW(BW,XdB,Fn,Idx)

Y = 0;
Count = 0.0001:0.0001:1; %Scaler
Count = flip(Count);

for i = Count 
tmp = -20*(log10(Fn(Idx)/(BW*i)))-40;
if tmp < -XdB
Y = i;    
break
end
end

Y = 1/Y;

return