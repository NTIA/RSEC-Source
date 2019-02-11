function h = RESTextOn(h)
global CObject

h.htext1=text(CObject.PlotAX1,h.X(1),-5,...
   [' BWres: ' num2str(h.ResBW) '\newline DETtype: ' h.DETtype],'FontSize',8,...
   'units','inches','BackgroundColor','w','edgecolor','k');

set(h.htext1,'units','inches','position',[0.05 3.180]);

return