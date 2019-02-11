function h = PlotTitleII(AppData,N)
% global CObject

switch N
    
    case 1
    Str1 = ['Mod Type=' AppData.ModT ' FC=',num2str(AppData.FC),' FCM=',num2str(AppData.FCM),...
       ' Bc=',num2str(AppData.CBW),' Bs=',num2str(AppData.Bs),' t=',num2str(AppData.PW),...
       ' tr=',num2str(AppData.PRT),' d=',num2str(AppData.d),' PRR=',num2str(AppData.PRR),...
       ' Pp=',num2str(AppData.PP),' N=',num2str(AppData.N)];
   
    Str2 = ['Pt=',num2str(AppData.Pt),' bw40dB=',num2str(AppData.bw40dB),' bwRSECn=',num2str(AppData.bwRSECn),...
       ' bwRSECo=',num2str(AppData.bwRSECo),' PG=',num2str(AppData.PG),' XdB=',num2str(AppData.XdB),...
       ' RSECcrit=',AppData.RSECcrit];

    case 2
    Str1 =  ['Mod Type=' AppData.ModT,' Bc=',num2str(AppData.CBW),' Bs=',num2str(AppData.Bs),...
       ' t=',num2str(AppData.PW),' tr=',num2str(AppData.PRT),' d=',num2str(AppData.d),' PRR=',...
       num2str(AppData.PRR),' Pp=',num2str(AppData.PP),' N=',num2str(AppData.N)]; 
   
    Str2 = [' Pt=',num2str(AppData.Pt),' bw40dB=',num2str(AppData.bw40dB),' bwRSECn=',num2str(AppData.bwRSECn),...
       ' bwRSECo=',num2str(AppData.bwRSECo),' PG=',num2str(AppData.PG),' XdB=',num2str(AppData.XdB),...
       ' RSECcrit=',AppData.RSECcrit];
   
    case 3
    Str1 = 'This plot is from Measured RSMS Data Only';  
    Str2 = '*****************************************';
    
end

MyTitle = [{Str1},{Str2}];

h = title(MyTitle,'FontSize', 8);

return


