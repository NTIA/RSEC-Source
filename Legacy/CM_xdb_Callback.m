function CM_xdb_Callback(hObject, eventdata, handles)
global CObject AppData 

AppData.CMxdb=str2num(CObject.COPTBox2.String);
assignin('base', 'CMxdb',AppData.CMxdb);

xdblegstate = get(CObject.Legend, 'value');
xdbpropstate = get(CObject.Legacy,'value');

AppData = PlotRSEC(AppData,1);

set(CObject.Legend,'value',xdblegstate);

hObject.Value = xdblegstate;

LegendTog(hObject, eventdata, AppData);

set(CObject.Legacy,'value',xdbpropstate);

hObject.Value = xdbpropstate;

LegacyTog(hObject, eventdata, AppData);

drawnow

return