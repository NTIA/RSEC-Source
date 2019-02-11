function SaveAs_1(varargin)
global AppData

AppData.SysDir = pwd;
AppData.SysName = AppData.RadarFName;

[AppData.SysName,AppData.SysDir]=uiputfile('*.mat','Save system file as',...
   [AppData.SysDir '\' AppData.SysName]);
if AppData.SysName==0
   return;
end

 fname = [AppData.SysDir AppData.SysName];
 save(fname,'AppData');
 
 return