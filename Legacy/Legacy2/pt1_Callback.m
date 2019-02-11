function pt1_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.Pt = str2num(CObject.PtB1.String);

refresh;

return