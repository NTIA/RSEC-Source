function xmin1_Callback(varargin)
global AppData CObject

if ~isfield(AppData,'xmin')
AppData.xmin = [];
end

AppData.xmin = str2num(CObject.Xmin1.String);

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