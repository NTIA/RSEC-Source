function [X,Y] = MakeLinearSpectrum(AppData,Flags)
global CObject 

if Flags.MorKSwitch
FAC = 0.001;
else
    if (AppData.FC - AppData.L3dBPtMhz) < 1
    FAC = 0.0001;
    else
    FAC = 0.1;
    end
end

FCent = AppData.FC;
FSpurL = AppData.L60dBPtMhz - 100;
FSpurU = AppData.H60dBPtMhz + 100;

F3dBL  = AppData.L3dBPtMhz;
F3dBU  = AppData.H3dBPtMhz;
F20dBL = AppData.L20dBPtMhz;
F20dBU = AppData.H20dBPtMhz;
F40dBL = AppData.L40dBPtMhz;
F40dBU = AppData.H40dBPtMhz;
F60dBL = AppData.L60dBPtMhz;
F60dBU = AppData.H60dBPtMhz;

SSpur = AppData.SpurLevdB;
S2Harm = AppData.Lev2HarmdB;
S3Harm = AppData.Lev3HarmdB;
SOHarm = AppData.LevOTHdB;


% Choosing highest Spurious/Harmonic level for plot noise floor

if isempty(SSpur)   % Default -65 if empty; overwrite any old data
    SSpur = -65;
end

if S2Harm > SSpur
    SSpur = S2Harm;
end

if S3Harm > SSpur
    SSpur = S3Harm;
end

if SOHarm > SSpur
    SSpur = SOHarm;
end

if isempty(SSpur)   % Default -65 if any are empty
    SSpur = -65;
end

F1 = FSpurL:FAC:(F60dBL-FAC);
F2 = F60dBL:FAC:(F40dBL-FAC);
F3 = F40dBL:FAC:(F20dBL-FAC);
F4 = F20dBL:FAC:(F3dBL-FAC);
F5 = F3dBL:FAC:(FCent-FAC);
F6 = FCent+FAC:FAC:F3dBU;
F7 = (F3dBU+FAC):FAC:F20dBU;
F8 = (F20dBU+FAC):FAC:F40dBU;
F9 = (F40dBU+FAC):FAC:F60dBU;
F10 =(F60dBU+FAC):FAC:FSpurU;

X = [F1 F2 F3 F4 F5 F6 F7 F8 F9 F10];

ScaleFactor = (1/length(F1))*(abs(SSpur)-60); 

S1 = (SSpur:ScaleFactor:-60);
S1 = S1(1:end-1);

ScaleFactor = (1/length(F2))* 20; 

S2 = (-60:ScaleFactor:-40);
S2 = S2(1:end-1);

ScaleFactor = (1/length(F3))* 20; 

S3 = (-40:ScaleFactor:-20);
S3 = S3(1:end-1);

ScaleFactor = (1/length(F4))* 17; 

S4 = (-20:ScaleFactor:-3);
S4 = S4(1:end-1);

ScaleFactor = (1/length(F5))* 3; 

S5 = (-3:ScaleFactor:0);
S5 = S5(1:end-1);

ScaleFactor = (1/length(F6))* 3; 

S6 = flip(-3:ScaleFactor:0);
S6 = S6(1:end-1);

ScaleFactor = (1/length(F7))* 17; 

S7 = flip(-20:ScaleFactor:-3);
S7 = S7(1:end-1);

ScaleFactor = (1/length(F8))* 20; 

S8 = flip(-40:ScaleFactor:-20);
S8 = S8(1:end-1);

ScaleFactor = (1/length(F9))* 20; 

S9 = flip(-60:ScaleFactor:-40);
S9 = S9(1:end-1);

ScaleFactor = (1/length(F10))*(abs(SSpur)-60); 

S10 = flip(SSpur:ScaleFactor:-60);
S10 = S10(1:end-1);


Y = [S1 S2 S3 S4 S5 S6 S7 S8 S9 S10];
Y = Y-max(Y); 

CObject.mfsub2.Enable = 'off';
return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%