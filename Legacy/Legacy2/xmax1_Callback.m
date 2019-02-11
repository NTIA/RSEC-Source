function xmax1_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.xmax = str2num(CObject.Xmax1.String);

set(CObject.PlotAX1,'xlim',[AppData.xmin AppData.xmax]);
set(CObject.PlotAX1,'xtick',maketicks(AppData));
set(CObject.PlotAX1,'ylim',[AppData.ymin AppData.ymax]);
set(CObject.PlotAX1,'ytick',AppData.ymin:AppData.ystep:AppData.ymax);

return

function x=maketicks(h)
global CObject

if get(CObject.TogNormIF,'value')
   x=ceil(h.xmin/h.xstep)*h.xstep:h.xstep:h.xmax;
else
   x=h.xmin:h.xstep:h.xmax;
end