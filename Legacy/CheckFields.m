function CheckFields(varargin)
global Flags CObject

if isempty(CObject.PW.String) || str2double(CObject.PW.String) == 0
    
ed = errordlg('Pluse Width is a required field!');
SetFigIcon(ed,'Radar.png');
waitfor(ed);

Flags.ModSet = 0;

else
    
Flags.ModSet = 1;    

end

if isempty(CObject.PRT.String) || str2double(CObject.PRT.String) == 0
    
ed = errordlg('Pluse Rise Time is a required field!');
SetFigIcon(ed,'Radar.png');
waitfor(ed);

Flags.ModSet = 0;
CObject.mesub1.Enable = 'off';
CObject.Button.Enable = 'off'; 

else
    
Flags.ModSet = 1; 
CObject.mesub1.Enable = 'on';
CObject.Button.Enable = 'on'; 

end

if isempty(CObject.PFT.String) || str2double(CObject.PFT.String) == 0
    
ed = errordlg('Pluse Fall Time is a required field!');
SetFigIcon(ed,'Radar.png');
waitfor(ed);

Flags.ModSet = 0;
CObject.mesub1.Enable = 'off';
CObject.Button.Enable = 'off'; 

else
    
Flags.ModSet = 1; 
CObject.mesub1.Enable = 'on';
CObject.Button.Enable = 'on';    

end


return