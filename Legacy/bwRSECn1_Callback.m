function bwRSECn1_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.bwRSECn=str2num(get(hObject,'String'));
CObject.BW40EB1.String = num2str(AppData.bwRSECn);
AppData = updateMask(AppData);

refresh;

return
