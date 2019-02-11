function MeasuredTog(hObject, ~,~)
global AppData CObject Flags TraceLocker

IconLocation = [pwd '\Radar.png'];

if get(hObject,'Value')
   if min(AppData.Sm) == max(AppData.Sm)%if no real measured data, turn off curve
   set(TraceLocker.UserData,'visible','off');    

   ed = errordlg('Measured Data Has not been loaded!!','RSEC Error Msg ID1'); 
   
   warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
   jframe=get(ed,'javaframe');
   jIcon=javax.swing.ImageIcon(IconLocation);
   jframe.setFigureIcon(jIcon);        
   
   CObject.Measured.Value = 0;
   set(CObject.Measured,'BackGroundColor',[.87 .92 .98]);  
   else
   TogSet();
   set(TraceLocker.RESBW, 'Visible', 'off');
   %cla(CObject.PlotAX1);     
   PlotRSEC(AppData,1); 
   AppData = RESTextOn(AppData);
   TraceLocker.UserData.Visible = 'On';  
   set(TraceLocker.RedRings,'visible','On'); 
   set(TraceLocker.GreenRings,'visible','On'); 
   set(CObject.Measured,'BackGroundColor',[0.3 0.75 0.93]);  
   end 
  
else
   set(CObject.Measured,'BackGroundColor',[.87 .92 .98]);  
   CObject.CustomMask.Value = 0;
   CObject.Measured.Value = 0;
   Flags.CustomPage = 0;
   TraceLocker.UserData.Visible = 'Off';  
   set(TraceLocker.RedRings,'visible','Off'); 
   set(TraceLocker.GreenRings,'visible','Off'); 
   CustomTog; 
   drawnow
   cla(CObject.PlotAX1); 
   AppData = PlotRSEC(AppData,0);
   
end


return