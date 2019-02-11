function FC_Butt_Call(varargin)
global AppData CObject Flags

AppData.FC = CObject.EBox6.String;
 
if str2double(AppData.FC) > 0
Flags.FCSet = 1;
end

Flags.GoGo = Flags.ModSet + Flags.FCSet + Flags.RNameSet;

if Flags.GoGo >= 3
CObject.mesub1.Enable = 'on';
CObject.Button.Enable = 'on'; 
end

return