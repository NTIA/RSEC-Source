function h = RSECPlot(h,Fp,N) 
global CObject TraceLocker

 TraceLocker.UserData = plot(CObject.PlotAX1,h.Fm,h.Sm,'-','LineWidth', 1.0);         
 TraceLocker.RSEC_Mask = plot(CObject.PlotAX1,Fp,h.oRollOff,'m-','LineWidth', 1.35);               
 TraceLocker.ProposedRSEC = plot(CObject.PlotAX1,Fp,h.nRollOff,':','Color',[0.64 0.08 0.18],'LineWidth', 1.5);  
 TraceLocker.Theory = plot(CObject.PlotAX1,h.Ft,h.St,'-');       
 TraceLocker.CustomMask = plot(CObject.PlotAX1,Fp,h.custMask, 'r:','LineWidth', 1.5);
 drawnow
 set(TraceLocker.Theory,'color',[0.7 0.7 0.7]);
 set(TraceLocker.Theory,'visible','off');

switch N
    
    case 1
    TraceLocker.RedRings = plot(CObject.PlotAX1,h.FC,0,'ro');         
    TraceLocker.GreenRings = plot(CObject.PlotAX1,h.FC,0,'go'); 
    set(TraceLocker.RedRings,'visible','off');
    set(TraceLocker.GreenRings,'visible','off');
    
    case 2
    TraceLocker.RedRings = plot(CObject.PlotAX1,Fp(h.oo),h.Sm(h.oo),'ro');         
    TraceLocker.GreenRings = plot(CObject.PlotAX1,h.FC,0,'go');      
    set(TraceLocker.GreenRings,'visible','off');
    set(TraceLocker.RedRings,'visible','off');
           
    case 3
    TraceLocker.RedRings = plot(CObject.PlotAX1,Fp(h.oo),h.Sm(h.oo),'ro');         
    TraceLocker.GreenRings = plot(CObject.PlotAX1,Fp(h.uu),h.Sm(h.uu),'go'); 
    set(TraceLocker.RedRings,'visible','off');
    set(TraceLocker.GreenRings,'visible','off');
    
end
 
  
  return