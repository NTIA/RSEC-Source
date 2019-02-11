function TheoryTog(hObject, eventdata, handles)
global AppData CObject TraceLocker
IconLocation = [pwd '\Radar.png'];

if get(hObject,'Value')
   if isempty(AppData.PRR)
   wd = warndlg('No PRR, therefore no theoretical spectrum');
   warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
   jframe=get(wd,'javaframe');
   jIcon=javax.swing.ImageIcon(IconLocation);
   jframe.setFigureIcon(jIcon); 
   uiwait(wd); 
   CObject.Theory.Value = 0;
   else      
   set(TraceLocker.Theory,'visible','on')
   set(CObject.Theory,'BackGroundColor',[0.3 0.75 0.93]);  
   end
else
   set(TraceLocker.Theory,'visible','off')
   set(CObject.Theory,'BackGroundColor',[.87 .92 .98]);  
end