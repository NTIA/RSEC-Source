function xdb1_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.ymin = -str2double(CObject.XdB1.String);
CObject.XdB1.String = num2str(AppData.XdB);
updateMask(AppData);
set(CObject.PlotAX1,'ylim',[AppData.ymin AppData.ymax]);
drawnow

return