function ITM = Load_ITM_Parameters()
%%% Loads ITM Parameters
USGSDir = 'P:\(G) Spectrum Engineering and Analysis Division\USGS\';

ITM.TerrainDir = USGSDir;
ITM.UseUSGS=1; %using USGS
ITM.Refrac=301;
ITM.Dielect=15;
ITM.Conduct=0.005;
ITM.Pol=1;
ITM.RC=5;
ITM.ModeofVariability = 0;
ITM.deltaH_m = 90;
ITM.TxSc = 2; 
ITM.RxSc = 0; 
ITM.ConfPctBase=0.10; 
ITM.ConfPctUE=0.50; 
ITM.VaryConfStat=0;
ITM.RelPct=0.50;
ITM.TimePct=0.10; 
ITM.SituationPct=0.10; 
ITM.LocPct=0.50; 

return


