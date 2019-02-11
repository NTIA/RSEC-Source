function Export_1(varargin)
global AppData CObject

IconLocation = [pwd '\Logo.png'];

if strcmp(CObject.PlotAX1.Visible,'on')
    
      [AppData.RadarFName,AppData.OutDir]= uiputfile('*.png','Save figure as',...
      [pwd '\' AppData.RadarFName '_' num2str(AppData.nSlope) '.png']);
  
   if AppData.OutDir==0
      WD = warndlg('Export Was Cancelled','NTIA OSM: Warning!!'); 
      warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
      jframe=get(WD,'javaframe');
      jIcon=javax.swing.ImageIcon(IconLocation);
      jframe.setFigureIcon(jIcon);  
      return;
   end
   
   fileName = [AppData.OutDir AppData.RadarFName];
   saveas(gcf,fileName);
   fileName = ''; %#ok<NASGU>
  
else
   WD = warndlg('Need to Plot before exporting the figure','NTIA OSM: Warning!!');
   
   warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
   jframe=get(WD,'javaframe');
   jIcon=javax.swing.ImageIcon(IconLocation);
   jframe.setFigureIcon(jIcon);   
   
end

return