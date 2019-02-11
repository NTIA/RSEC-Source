function slope1_Callback(hObject, eventdata, handles)
global AppData 

AppData.nSlope = str2num(get(hObject,'String'));
updateMask(AppData);
refresh;

return