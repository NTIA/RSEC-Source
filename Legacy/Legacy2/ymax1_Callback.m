function ymax1_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.ymax=str2num(get(hObject,'String'));
set(CObject.PlotAX1,'ylim',[AppData.ymin AppData.ymax]);
set(CObject.PlotAX1,'ytick',AppData.ymin:AppData.ystep:AppData.ymax);

return