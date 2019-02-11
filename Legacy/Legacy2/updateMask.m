function h = updateMask(h)
global CObject TraceLocker

if sum(strcmp(h.Criteria,{'','F'}))
   h.oRollOff=zeros(length(h.Fm),1);
   h.oo=[];h.uu=[];
else
    if isempty(h.bwRSECn)
    h.bwRSECn = h.bwRSECo;
    end
    h.oRollOff = getMask(h.bwRSECn,h.XdB,h.oSlope, h.Fm-h.FCM);
   [h.oo h.uu] = ThreshCrossings(h.Sm,h.oRollOff);
end

if get(CObject.TogNormIF,'value')
   Fp=h.Fm-h.FC;
else
   Fp=h.Fm;
end

set(TraceLocker.RSEC_Mask,'xdata',Fp,'ydata',h.oRollOff);

if isempty(h.oo)
   set(TraceLocker.RedRings,'xdata',h.FC,'ydata',0,'visible','off');
else
   set(TraceLocker.RedRings,'xdata',Fp(h.oo),'ydata',h.Sm(h.oo));
   if get(CObject.Overage,'value')==0
      set(TraceLocker.RedRings,'visible','on');
   end
end

if isempty(h.uu)
   set(TraceLocker.GreenRings,'xdata',h.FC,'ydata',0,'visible','off');
else
   set(TraceLocker.GreenRings,'xdata',Fp(h.uu),'ydata',h.Sm(h.uu));
   if get(CObject.Overage,'value')==0
      set(TraceLocker.GreenRings,'visible','on');
   end
end

h.htitle = PlotTitleII(h,1);

LegendTog;

return