function NormRes(hObject, eventdata, handles)
global AppData CObject

%Intialize
AppData.xmin1 = [];
AppData.xmax1 = [];

Reference = AppData.FC;

if get(CObject.TogNormIF,'value')
   set(CObject.TogNormIF,'BackGroundColor',[0.3 0.75 0.93]); 
   
   AppData.xmax = AppData.xmax - Reference;
   AppData.xmin = AppData.xmin - Reference;
   AppData.Ft = AppData.Ft - Reference;
      
else
   set(CObject.TogNormIF,'BackGroundColor',[.87 .92 .98]);
   
   AppData.xmax = AppData.xmax + Reference;
   AppData.xmin = AppData.xmin + Reference;
   AppData.Ft = AppData.Ft + Reference;
   
end

updateFreq(AppData);

if strcmp(get(AppData.htitle,'visible'),'on')
updateTitle(AppData);
end
set(AppData.xmin1,'string',num2str(AppData.xmin));
set(AppData.xmax1,'string',num2str(AppData.xmax));

function updateFreq(h)
global CObject TraceLocker

if get(CObject.TogNormIF,'value')
Fp=h.Fm-h.FC;
else
Fp=h.Fm;
end

set(TraceLocker.UserData,'xdata',Fp,'ydata',h.Sm);
set(TraceLocker.RSEC_Mask,'xdata',Fp,'ydata',h.nRollOff);
set(TraceLocker.ProposedRSEC,'xdata',Fp,'ydata',h.oRollOff);
set(TraceLocker.Theory,'xdata',h.Ft,'ydata',h.St);
set(TraceLocker.CustomMask,'xdata',Fp,'ydata',h.custMask);

if ~isempty(h.oo)
set(TraceLocker.RedRings,'xdata',Fp(h.oo),'ydata',h.Sm(h.oo));
end

if ~isempty(h.uu)
set(TraceLocker.GreenRings,'xdata',Fp(h.uu),'ydata',h.Sm(h.uu));
end

axes(CObject.PlotAX1);

xlim([h.xmin h.xmax]);
ylim([h.ymin h.ymax]);

set(CObject.PlotAX1,'xtick',maketicks(h));
return

function updateTitle(h)
global CObject

if ~isfield(h,'htitle')
   return
end

if get(CObject.TogNormIF,'value')
  h.htitle = PlotTitleII(h,2);
else
  h.htitle = PlotTitleII(h,1);
end

return

function x=maketicks(h)
global CObject

if get(CObject.TogNormIF,'value')
   x=ceil(h.xmin/h.xstep)*h.xstep:h.xstep:h.xmax;
else
   x=h.xmin:h.xstep:h.xmax;
end
return