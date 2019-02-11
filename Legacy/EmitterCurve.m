
function TX_C = EmitterCurve (DeltaFreq,TXPNTS_F,TXPNTS_dB,TXSF)
% This function builds the emitter curve based on the user inputs and
% freqency sweep, a bit of an artifact as I was unsure which direction the
% project was taking
%%
EmissionCurve = size(DeltaFreq); c = numel(DeltaFreq)+1; % Dim Array before loading
LFTest= min(TXPNTS_F); RFTest = max(TXPNTS_F); % setup loop values
z = 1; LeftFringeFreq = (LFTest); RightFringeFreq = (RFTest); % find band fringe values
%ExtraSlope_TX_Left = SL; 

while z < c  %This loop is not scalable. It assumes a [0, 3, 20, 40, 60] distribution
  
  if DeltaFreq(z)<= LeftFringeFreq 
  % EmissionCurve(z)= (((log10(abs(DeltaFreq(z)))-log10(abs(TXPNTS_F(1))))*abs(ExtraSlope_TX_Left))-TXPNTS_dB(1))*-1;
  EmissionCurve(z)= -(abs(TXPNTS_dB(1))+ (abs(DeltaFreq(z))-abs(TXPNTS_F(1))) * TXSF);
  end %The code above uses log/lin extrapolation from Left end to fringe.. I just switched it to log
  if DeltaFreq(z) > LeftFringeFreq && (DeltaFreq(z) <= TXPNTS_F(2))
  EmissionCurve(z)= (abs(TXPNTS_dB(1)-TXPNTS_dB(2))/abs(TXPNTS_F(1)-TXPNTS_F(2)))*(abs(TXPNTS_F(1))-abs(DeltaFreq(z)))+(TXPNTS_dB(1));
  end %This code is in band Linear interpolation
  if DeltaFreq(z) > TXPNTS_F(2) && (DeltaFreq(z) <= TXPNTS_F(3))
  EmissionCurve(z)= (abs(TXPNTS_dB(2)-TXPNTS_dB(3))/abs(TXPNTS_F(2)-TXPNTS_F(3)))*(abs(TXPNTS_F(2))-abs(DeltaFreq(z)))+(TXPNTS_dB(2));
  end %This code is in band Linear interpolation
  if DeltaFreq(z) > TXPNTS_F(3) && (DeltaFreq(z) <= TXPNTS_F(4))
  EmissionCurve(z)= (abs(TXPNTS_dB(3)-TXPNTS_dB(4))/abs(TXPNTS_F(3)-TXPNTS_F(4)))*(abs(TXPNTS_F(3))-abs(DeltaFreq(z)))+(TXPNTS_dB(3));
  end %This code is in band Linear interpolation
  if DeltaFreq(z) > TXPNTS_F(4) && (DeltaFreq(z) <= TXPNTS_F(5))
  EmissionCurve(z)= (abs(TXPNTS_dB(4)-TXPNTS_dB(5))/abs(TXPNTS_F(4)-TXPNTS_F(5)))*(abs(TXPNTS_F(4))-abs(DeltaFreq(z)))+(TXPNTS_dB(4));
  end %This code is in band Linear interpolation
  if DeltaFreq(z) == 0 
  EmissionCurve(z)= 0;% Normalized to 0 dB
  end %This code is in band Linear interpolation
  if DeltaFreq(z) > TXPNTS_F(5) && (DeltaFreq(z) <= TXPNTS_F(6))
  EmissionCurve(z)= (abs(TXPNTS_dB(5)-TXPNTS_dB(6))/abs(TXPNTS_F(5)-TXPNTS_F(6)))*(abs(TXPNTS_F(5))-abs(DeltaFreq(z)))+(TXPNTS_dB(5));
  end %This code is in band Linear interpolation
  if DeltaFreq(z) > TXPNTS_F(6) && (DeltaFreq(z) <= TXPNTS_F(7))
  EmissionCurve(z)= (abs(TXPNTS_dB(6)-TXPNTS_dB(7))/abs(TXPNTS_F(6)-TXPNTS_F(7)))*(abs(TXPNTS_F(6))-abs(DeltaFreq(z)))+(TXPNTS_dB(6));
  end %This code is in band Linear interpolation
  if DeltaFreq(z) > TXPNTS_F(7) && (DeltaFreq(z) <= TXPNTS_F(8))
  EmissionCurve(z)= (abs(TXPNTS_dB(7)-TXPNTS_dB(8))/abs(TXPNTS_F(7)-TXPNTS_F(8)))*(abs(TXPNTS_F(7))-abs(DeltaFreq(z)))+(TXPNTS_dB(7));
  end %This code is in band Linear interpolation    
  if DeltaFreq(z) > TXPNTS_F(8) && (DeltaFreq(z) <= TXPNTS_F(9))
  EmissionCurve(z)= (abs(TXPNTS_dB(8)-TXPNTS_dB(9))/abs(TXPNTS_F(8)-TXPNTS_F(9)))*(abs(TXPNTS_F(8))-abs(DeltaFreq(z)))+(TXPNTS_dB(8));
  end %This code is in band Linear interpolation    
  if DeltaFreq(z)>= RightFringeFreq
  EmissionCurve(z)= -(abs(TXPNTS_dB(1))+ (abs(DeltaFreq(z))-abs(TXPNTS_F(1))) * TXSF);
  end %The code above uses log/lin extrapolation from Right end to fringe
  z=z+1;
  
end

TX_C = EmissionCurve;
%End
