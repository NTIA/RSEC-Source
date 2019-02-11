function FC_Butt(varargin)
global AppData CObject Flags

if isfield(AppData,'FC')
CObject.EBox6.String = num2str(AppData.FC);
else
AppData.FC = '0000';    
end

FL = str2double(CObject.EBox4.String);
FH = str2double(CObject.EBox5.String);

if FL ~= 0 && FH ~= 0
    FC = FL + ((FH-FL)/2);
    CObject.EBox6.String = num2str(FC);
    AppData.FC = FC;
end

if ischar(AppData.FC)
if str2double(AppData.FC) > 0
Flags.FCSet = 1;
end
else
if AppData.FC > 0
Flags.FCSet = 1;
end
end

Flags.GoGo = Flags.ModSet + Flags.FCSet + Flags.RNameSet;

if Flags.GoGo >= 3
CObject.mesub1.Enable = 'on';
CObject.Button.Enable = 'on'; 
end

return