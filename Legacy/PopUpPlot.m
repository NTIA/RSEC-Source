function PopUpPlot(varargin)
global Flags CObject 

Flags.ViewOnly = 1;
FC_Butt;
CreateFigPlot;
plot(CObject.PlotAX1,AppData.Fm,AppData.Sm);
CObject.PlotFig.Visible = 'On';    
CObject.Button.Enable = 'Off'; 

Flags.ViewOnly = 0;
CObject.mm.Enable = 'Off';
return