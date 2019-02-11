function ystep1_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.ystep=str2num(get(hObject,'String'));
set(CObject.PlotAX1,'ytick',AppData.ymin:AppData.ystep:AppData.ymax);

return