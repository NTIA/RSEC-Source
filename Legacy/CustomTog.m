function CustomTog(hObject, eventdata, handles)
global AppData CObject FigData Flags TraceLocker

if Flags.CustomPage || CObject.CustomMask.Value
    
    CObject.Text1 = uicontrol('Style','text',...
             'FontSize',10,...
             'FontWeight','bold',...
             'FontAngle','italic',...
             'BackgroundColor',[.94 .87 .87 ],...
             'ForegroundColor','black',...
             'String','Custom Mask Options:',...
             'Units', FigData.Units,...
             'HorizontalAlignment','center',...
             'Position',[10 10 200 20]);
         
         
    CObject.COPTLab1 = uicontrol('Style', 'text', ...
             'Position',[205 9 50 20], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',[.94 .87 .87 ],...
             'HorizontalAlignment','left',...
             'String','BW:');  
       
         
    CObject.COPTBox1 = uicontrol('Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','bold',...
             'FontSize',9, ...
             'Callback',@CM_bw_Callback,...
             'HorizontalAlignment','left',...
             'Position',[235 12 40 20]); 
             CMIM1 = uicontextmenu;
             CObject.COPTBox1.UIContextMenu = CMIM1;
             txt(1)={'Enter bandwidth for custom mask [MHz]'};
             txt(2)={'For information only - NOT VALID FOR RSEC COMPLIANCE'};
             txt(3)={'(optional)'};
             uimenu(CMIM1,'Label','Info','Callback',@Info_All,'UserData',txt);
         
    CObject.COPTLab2 = uicontrol('Style', 'text', ...
             'Position',[295 9 50 20], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',[.94 .87 .87 ],...
             'HorizontalAlignment','left',...
             'String','XdB:');  
       
    CObject.COPTBox2 = uicontrol('Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','bold',...
             'FontSize',9, ...
             'Callback',@CM_xdb_Callback,...
             'HorizontalAlignment','left',...
             'Position',[325 12 40 20]); 
             CMIM2 = uicontextmenu;
             CObject.COPTBox2.UIContextMenu = CMIM2;
             txt(1)={'Enter Minimum RSEC mask level for custom mask [dB]'};
             txt(2)={'For information only - NOT VALID FOR RSEC COMPLIANCE'};
             txt(3)={'(optional)'};
             uimenu(CMIM2,'Label','Info','Callback',@Info_All,'UserData',txt);
         
    CObject.COPTLab3 = uicontrol('Style', 'text', ...
             'Position',[385 9 50 20], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',[.94 .87 .87 ],...
             'HorizontalAlignment','left',...
             'String','Slope:');  
       
    CObject.COPTBox3 = uicontrol('Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','bold',...
             'FontSize',9, ...
             'Callback',@CM_slope_Callback,...
             'HorizontalAlignment','left',...
             'Position',[425 12 50 20]); 
             CMIM3 = uicontextmenu;
             CObject.COPTBox3.UIContextMenu = CMIM3; 
             txt(1)={'Enter RSEC mask rolloff slope for custom mask [dB/dec]'};
             txt(2)={'For information only - NOT VALID FOR RSEC COMPLIANCE'};
             txt(3)={'(optional)'};
             uimenu(CMIM3,'Label','Info','Callback',@Info_All,'UserData',txt);
         
   set(CObject.CustomMask,'BackGroundColor',[0.3 0.75 0.93]);  
   CObject.Text1.Visible = 'on';
   CObject.COPTLab1.Visible = 'on';
   CObject.COPTBox1.Visible = 'on';
   CObject.COPTLab2.Visible = 'on';
   CObject.COPTBox2.Visible = 'on';
   CObject.COPTLab3.Visible = 'on';
   CObject.COPTBox3.Visible = 'on';
   set(TraceLocker.CustomMask,'visible','on');
   Flags.CustomPage = 0;
   
else
   set(CObject.CustomMask,'BackGroundColor',[.87 .92 .98]); 
   
   CObject.Text1.Visible = 'off';
   CObject.COPTLab1.Visible = 'off';
   CObject.COPTBox1.Visible = 'off';
   CObject.COPTLab2.Visible = 'off';
   CObject.COPTBox2.Visible = 'off';
   CObject.COPTLab3.Visible = 'off';
   CObject.COPTBox3.Visible = 'off';
   
   if ~Flags.CustomPage && Flags.PageFlag
   set(TraceLocker.CustomMask,'visible','off');
   end
     
   Flags.CustomPage = 1;
   
end

if strcmp(get(AppData.hlegend,'visible'),'on')

if get(CObject.CustomMask,'value') && strcmp(get(TraceLocker.ProposedRSEC,'visible'),'on')
    % CustMask on 2020 on
   AppData.hlegend=legend([TraceLocker.UserData, TraceLocker.RSEC_Mask, TraceLocker.ProposedRSEC,TraceLocker.CustomMask],AppData.RadarFName,...
   ['RSEC Mask ' AppData.Criteria ' ' num2str(AppData.oSlope) 'dB/dec'],...
   ['Proposed RSEC ' AppData.Criteria ' ' num2str(AppData.nSlope) 'dB/dec'],...
   ['Custom Mask ' num2str(AppData.CMxdb) 'dB/dec'],'Location','northeast');

elseif get(CObject.CustomMask,'value') && strcmp(get(TraceLocker.ProposedRSEC,'visible'),'off')
    % CustMask on 2020 off
   AppData.hlegend=legend([TraceLocker.UserData, TraceLocker.RSEC_Mask,TraceLocker.CustomMask],AppData.RadarFName,...
   ['RSEC Mask ' AppData.Criteria ' ' num2str(AppData.oSlope) 'dB/dec'],...
   ['Custom Mask ' num2str(AppData.CMxdb) 'dB/dec'],'Location','northeast');
    

else % CustMask off
    if strcmp(get(TraceLocker.ProposedRSEC,'visible'),'on')
    % CustMask off 2020 on
   AppData.hlegend=legend([TraceLocker.UserData, TraceLocker.RSEC_Mask, TraceLocker.ProposedRSEC],AppData.RadarFName,...
   ['RSEC Mask ' AppData.Criteria ' ' num2str(AppData.oSlope) 'dB/dec'],...
   ['Proposed RSEC ' AppData.Criteria ' ' num2str(AppData.nSlope) 'dB/dec'],'Location','northeast');
    else % CustMask off 2020 off
   AppData.hlegend=legend([TraceLocker.UserData, TraceLocker.RSEC_Mask],AppData.RadarFName,...
   ['RSEC Mask ' AppData.Criteria ' ' num2str(AppData.oSlope) 'dB/dec'],'Location','northeast');
    
    end
end
 
else
    set(AppData.hlegend,'visible','off');

end