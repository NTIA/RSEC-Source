function DisplayPhaseChipSettings(RL)
global CObject FigData 

    CObject.PHCTitle = uicontrol(CObject.Pan1,'Style', 'text', ...
                   'Position', [10,RL,250,18], ...
                   'FontSize', 9, ...
                   'FontWeight', 'bold', ...
                   'ForegroundColor','blue',...
                   'BackgroundColor',FigData.Color,...
                   'HorizontalAlignment','left',...
                   'String','Phase Chip Settings..');  
    CObject.PHCW = uicontrol(CObject.Pan1,'Style', 'edit', ...
                   'Position', [135,RL-25,50,20], ...
                   'FontSize', 8, ...
                   'BackgroundColor', 'white','Callback',@callbackfn);  
    CObject.PHCWLabel = uicontrol(CObject.Pan1,'Style', 'text', ...
                   'Position', [10,RL-25,112,18], ...
                   'FontSize', 8, ...
                   'FontWeight', 'bold', ...
                   'BackgroundColor',FigData.Color,...
                   'HorizontalAlignment','left',...
                   'String','Width (time):');
    CObject.PHCNum = uicontrol(CObject.Pan1,'Style', 'edit', ...
                   'Position', [135,RL-50,50,20], ...
                   'FontSize', 8, ...
                   'BackgroundColor', 'white','Callback',@callbackfn);  
    CObject.PHCNumLabel = uicontrol(CObject.Pan1,'Style', 'text', ...
                   'Position', [10,RL-50,125,18], ...
                   'FontSize', 8, ...
                   'FontWeight', 'bold', ...
                   'BackgroundColor',FigData.Color,...
                   'HorizontalAlignment','left',...
                   'String','Number of Chips (#):'); 
               
                    cm4 = uicontextmenu;
                    CObject.PHCW.UIContextMenu = cm4;
                    txt(1)={'Enter time width of each chip (usec).'};
                    txt(2)={''};
                    txt(3)={'(required field)'};
                    uimenu(cm4,'Label','Info','Callback',@Info_All,'UserData',txt);
                    cm5 = uicontextmenu;
                    CObject.PHCNum.UIContextMenu = cm5;
                    txt1(1)={'Enter number of chips used in each repetition'};
                    txt1(2)={''};
                    txt1(3)={'(required field)'};
                    uimenu(cm5,'Label','Info','Callback',@Info_All,'UserData',txt1);
               
end

function callbackfn(source,~)
global AppData CObject Flags MRData

if source ==  CObject.PHCW
AppData.PHCW = CObject.PHCW.String;
MRData.PHCW = AppData.PHCW;
end

if source ==  CObject.PHCNum
AppData.PHCNum = CObject.PHCNum.String;
end

if isempty(CObject.PHCW.String) || str2double(CObject.PHCW.String) == 0
    
ed = errordlg('Chip Time width is a required field!');
SetFigIcon(ed,'Radar.png');
waitfor(ed);

Flags.ModSet = 0;
CObject.mesub1.Enable = 'off';
CObject.Button.Enable = 'off'; 

else
    
Flags.ModSet = 1; 
CObject.mesub1.Enable = 'on';
CObject.Button.Enable = 'on';   

end

if isempty(CObject.PHCNum.String) || str2double(CObject.PHCNum.String) == 0
    
ed = errordlg('Number of Chips is a required field!');
SetFigIcon(ed,'Radar.png');
waitfor(ed);

Flags.ModSet = 0;
CObject.mesub1.Enable = 'off';
CObject.Button.Enable = 'off'; 

else
    
Flags.ModSet = 1; 
CObject.mesub1.Enable = 'on';
CObject.Button.Enable = 'on';  

end

end