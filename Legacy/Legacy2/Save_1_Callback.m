function Save_1_Callback(varargin)
global AppData

AppData.SysName=[AppData.RadarFName '.mat'];
AppData.SysDir = pwd;


if exist([AppData.SysDir AppData.SysName])==2 %#ok
   fname=[AppData.SysDir AppData.SysName];
   fstring(1)={'Are you sure you want to overwrite'};
   fstring(2)={[fname '?']};
   button=questdlg(fstring,'Overwrite Warning!','Yes','No','Maybe','Yes');
   
   if strcmp(button,'Yes')
   save(fname,'AppData');
   end
   
else
    
   if exist(AppData.SysDir)==7 %#ok
      [AppData.SysName,AppData.SysDir]=uiputfile('*.mat','Save system file as',...
      [AppData.SysDir '\' AppData.SysName]);
   else
      [AppData.SysName,AppData.SysDir]=uiputfile('*.mat','Save system file as',...
      [pwd '\' AppData.SysName]);
   end
   if AppData.SysName==0
      return;
   end
   fname = [AppData.SysDir AppData.SysName];
   save(fname,'AppData');
end 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%