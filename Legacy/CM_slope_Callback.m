function CM_slope_Callback(hObject, eventdata, handles)
global CObject AppData 

AppData.CMslope=str2num(CObject.COPTBox3.String);
assignin('base', 'CMslope',AppData.CMslope);

slopelegstate = get(CObject.Legend, 'value');
slopepropstate = get(CObject.Legacy,'value');

AppData = PlotRSEC(AppData,1);

set(CObject.Legend,'value',slopelegstate);

hObject.Value = slopelegstate;

LegendTog(hObject, eventdata, AppData);

set(CObject.Legacy,'value',slopepropstate);

hObject.Value = slopepropstate;

LegacyTog(hObject, eventdata, AppData);

drawnow

return