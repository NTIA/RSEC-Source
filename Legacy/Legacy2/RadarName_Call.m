function RadarName_Call(varargin)
global AppData Flags CObject

AppData.RadarFName = CObject.EBox1.String;

if ~isfield(AppData,'RadarFName')
CObject.EBox1.String = 'Radar X';
end

Flags.RNameSet = 1;

Flags.GoGo = Flags.ModSet + Flags.FCSet + Flags.RNameSet;

if Flags.GoGo >= 3
CObject.mesub1.Enable = 'on';
CObject.Button.Enable = 'on'; 
end