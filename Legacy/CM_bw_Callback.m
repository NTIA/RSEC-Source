function CM_bw_Callback(hObject, eventdata, handles)
global CObject AppData 

AppData.CMbw = str2num(CObject.COPTBox1.String);
assignin('base', 'CMbw',AppData.CMbw);

bwlegstate=get(CObject.Legend, 'value');
bwpropstate=get(CObject.Legacy,'value');

AppData = PlotRSEC(AppData,1);

set(CObject.Legend,'value',bwlegstate);

hObject.Value = bwlegstate;

LegendTog(hObject, eventdata, AppData);

set(CObject.Legacy,'value',bwpropstate);

hObject.Value = bwpropstate;

LegacyTog(hObject, eventdata, AppData);

drawnow

return