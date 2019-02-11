function xstep1_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.xstep = str2num(get(hObject,'String'));
set(CObject.PlotAX1,'xtick',maketicks(AppData));

return

function x=maketicks(h)
global CObject

if get(CObject.TogNormIF,'value')
   x=ceil(h.xmin/h.xstep)*h.xstep:h.xstep:h.xmax;
else
   x=h.xmin:h.xstep:h.xmax;
end