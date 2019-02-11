function ResBW(varargin)
global AppData CObject MRData Flags TraceLocker

hObject = varargin{1};

if get(hObject,'Value')
   set(TraceLocker.RESBW, 'Visible', 'off');
   set(CObject.TogResBW,'BackGroundColor',[0.3 0.75 0.93]); 
   
   if CObject.Measured.Value
   cla(CObject.PlotAX1);     
   PlotRSEC(AppData,1); 
   end
   drawnow;
   
   if isfield(MRData,'StartFRQ')
   AppData.SA1 = text(AppData.xmin +5,AppData.ymin + 20,['Start Frequency ' num2str(MRData.StartFRQ) ' MHz'],'color','blue');    
   AppData.SA1.FontSize = 8;
   AppData.SA2 = text(AppData.xmin +5,AppData.ymin + 15,['Stop Frequency ' num2str(MRData.StopFRQ) ' MHz'],'color','blue');    
   AppData.SA2.FontSize = 8;
   AppData.SA3 = text(AppData.xmin +5,AppData.ymin + 10,['Resolution BW ' num2str(MRData.RESBW) ' MHz'],'color','blue');    
   AppData.SA3.FontSize = 8;
   AppData.SA4 = text(AppData.xmin +5,AppData.ymin + 5,['Video BW ' num2str(MRData.VIDBW) ' MHz'],'color','blue');    
   AppData.SA4.FontSize = 8;
   end
   

else
   set(CObject.TogResBW,'BackGroundColor',[.87 .92 .98]); 
   
   if CObject.Measured.Value
   TraceLocker.RESBW = text(CObject.PlotAX1,AppData.X(1),-5,...
   [' BWres: ' num2str(AppData.ResBW) '\newline DETtype: ' AppData.DETtype],'FontSize',8,...
   'units','inches','BackgroundColor','w','edgecolor','k');
   set(TraceLocker.RESBW,'units','inches','position',[0.05 3.180]);    
   end
   
   set(TraceLocker.RESBW, 'Visible', 'on');
   
   if Flags.RSMSdata 
   set(AppData.SA1, 'Visible', 'off');
   set(AppData.SA2, 'Visible', 'off');
   set(AppData.SA3, 'Visible', 'off');
   set(AppData.SA4, 'Visible', 'off');
   end
   drawnow;
end