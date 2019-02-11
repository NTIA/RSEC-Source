function SumReport(varargin)
global AppData MRData Setup

if isempty(AppData.CBW)
AppData.CBW = 'N/A';
end

if isempty(MRData.PHCNum)
AppData.PHCNum = 'N/A';
end

if isempty(MRData.SPSNumb)
AppData.SPSNumb = 'None';
end
    

AppData.TabHead1 = {'Ref #','Name','Pulse Type','(t)Pulse Width (uSec)','(tr) Pulse Rise/Fall (uSec)',...
                    '(Bc) Chirp Band Width','(N) Number of Chips',...
                    '(PRR) Pulse Repetition (Hz)','(Fl) Lowest Frequency (MHz)',...
                    '(Fh)Highest Frequency (MHz)'};
          
AppData.SysTab1 = {AppData.SPSNumb,AppData.RadarFName,AppData.ModT,AppData.PW,AppData.PRT,...
                   AppData.CBW,AppData.PHCNum,AppData.PRR,AppData.FRQLow,AppData.FRQHi};

AppData.TabHead2 = {'Criteria','(Bs) Frequency Hopping Range (MHz)',...
                    '(Pt) Maximum Spectral Power Density (dBm/Hz)',...
                    '(PG) Processing Gain','BW20','BW40','BWX','Slope (dB/Dec)',...
                    'XdB Level(dB)','Peak Power (dBm)'};

AppData.SysTab2 = {AppData.Criteria,AppData.Bs,AppData.Pt,AppData.PG,...
                   AppData.bw20dB,MRData.bw40,MRData.bwXdB, AppData.oSlope,...
                   AppData.XdB,AppData.PP};  
               
Setup.Slope = num2str(AppData.oSlope);

          
SummaryReport();

return