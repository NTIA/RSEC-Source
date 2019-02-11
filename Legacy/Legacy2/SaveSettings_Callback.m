function SaveSettings_Callback(hObject, eventdata, handles)
global AppData CObject

%collect Panel Values and strings
AppData.RadarFName = CObject.EBox1.String;
AppData.Stage = CObject.PopUp2.Value;
AppData.SPSNumb = CObject.EBox2.String;
AppData.FRQLow = CObject.EBox4.String;
AppData.FRQHi = CObject.EBox5.String;
AppData.FC = CObject.EBox6.String;
AppData.PP = CObject.EBox7.String;
AppData.Gt = CObject.EBox8.String;
AppData.ResBW = CObject.EBox9.String;
AppData.Detect = CObject.PopUp3.Value;
AppData.Usage = CObject.PopUp4.Value;

if isempty(AppData.RadarFName)
AppData.RadarFName = 'Radar XYZ';
end

handles.SysName=[AppData.RadarFName '.mat'];

A = exist('handles.SysDir','dir');

if A ~= 0
   fname=[handles.SysDir handles.SysName];
   
   fstring(1)={'Are you sure you want to overwrite'};
   fstring(2)={[fname '?']};
   
   button=questdlg(fstring,'Overwrite Warning!','Yes','No','Maybe','Yes');
   if strcmp(button,'Yes')
      Handles2Mat(handles);
   end
   
else
   
      [handles.SysName,handles.SysDir]=uiputfile('*.mat','Save Settings as',...
      [pwd '\' handles.SysName]);
  
end

   if handles.SysName==0
      return;
   end
   fileName = [handles.SysDir '\' handles.SysName];
   save(fileName,'AppData');
   CObject.Button.Enable = 'on'; 
return

%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

