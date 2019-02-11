function OverTog(varargin)
global AppData CObject TraceLocker Flags

IconLocation = [pwd '\Radar.png'];

hObject = varargin{1};

if isempty(AppData.oo)
   set(TraceLocker.RedRings,'visible','off')
end

if get(hObject,'Value')
 
if ~Flags.TextData && ~Flags.ManData  
ed = errordlg('Load measured data prior to creating MASK to use this function.','OverUnder ED101');
SetFigIcon(ed,IconLocation);
waitfor(ed);
CObject.Overage.Value = 0;
return
end

set(TraceLocker.RedRings,'visible','on')
set(CObject.Overage,'BackGroundColor',[0.3 0.75 0.93]); 
else
set(TraceLocker.RedRings,'visible','off')
set(CObject.Overage,'BackGroundColor',[.87 .92 .98]);
end

if isempty(AppData.uu)
set(TraceLocker.GreenRings,'visible','off')
else

if get(hObject,'Value')
  set(TraceLocker.GreenRings,'visible','off')
else
  set(TraceLocker.GreenRings,'visible','on')
end
end