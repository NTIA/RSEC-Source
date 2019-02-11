function PutAxDown(AxHandle)
global CObject FigData

CObject.PlotAX1 = axes(AxHandle, ...
             'Units', FigData.Units, ...
             'Position', [160 150 560 325], ...
             'Box', 'on');
                 
             ylabel('Relative Power (dB)','FontWeight','bold','Color','k');
             xlabel('Frequency (MHz)','FontWeight','bold','Color','k');
             grid on;                    
             hold on;

CObject.PlotAX1.Visible = 'On';


return