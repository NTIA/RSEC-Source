function DisplayPulseSettings(RefLevel)
global CObject FigData 
RL = RefLevel;

    CObject.PWTitle = uicontrol(CObject.Pan1,'Style', 'text', ...
                   'Position', [10,RL,250,18], ...
                   'FontSize', 9, ...
                   'FontWeight', 'bold', ...
                   'ForegroundColor','blue',...
                   'BackgroundColor',FigData.Color,...
                   'HorizontalAlignment','left',...
                   'String','Pulse Width Settings..');  

    CObject.PW = uicontrol(CObject.Pan1,'Style', 'edit', ...
                   'Position', [120,RL-25,50,20], ...
                   'FontSize', 8, ...
                   'TAG','PW',...
                   'BackgroundColor', 'white','Callback',@callbackfn);  
    CObject.PWLabel = uicontrol(CObject.Pan1,'Style', 'text', ...
                   'Position', [10,RL-25,110,18], ...
                   'FontSize', 8, ...
                   'FontWeight', 'bold', ...
                   'BackgroundColor',FigData.Color,...
                   'HorizontalAlignment','left',...
                   'String','Pulse Width (usec):');
    CObject.PRT = uicontrol(CObject.Pan1,'Style', 'edit', ...
                   'Position', [120,RL-50,50,20], ...
                   'FontSize', 8, ...
                   'BackgroundColor', 'white','Callback',@callbackfn);  
    CObject.PRTLabel = uicontrol(CObject.Pan1,'Style', 'text', ...
                   'Position', [10,RL-50,110,18], ...
                   'FontSize', 8, ...
                   'FontWeight', 'bold', ...
                   'BackgroundColor',FigData.Color,...
                   'HorizontalAlignment','left',...
                   'String','Rise Time (usec):');           
    CObject.PFT = uicontrol(CObject.Pan1,'Style', 'edit', ...
                   'Position', [120,RL-75,50,20], ...
                   'FontSize', 8, ...
                   'BackgroundColor', 'white','Callback',@callbackfn);  
    CObject.PFTLabel = uicontrol(CObject.Pan1,'Style', 'text', ...
                   'Position', [10,RL-75,110,18], ...
                   'FontSize', 8, ...
                   'FontWeight', 'bold', ...
                   'BackgroundColor',FigData.Color,...
                   'HorizontalAlignment','left',...
                   'String','Fall Time (usec):');
    CObject.PRR = uicontrol(CObject.Pan1,'Style', 'edit', ...
                   'Position', [120,RL-100,50,20], ...
                   'FontSize', 8, ...
                   'BackgroundColor', 'white','Callback',@callbackfn);  
    CObject.PRRLabel = uicontrol(CObject.Pan1,'Style', 'text', ...
                   'Position', [10,RL-100,110,18], ...
                   'FontSize', 8, ...
                   'FontWeight', 'bold', ...
                   'BackgroundColor',FigData.Color,...
                   'HorizontalAlignment','left',...
                   'String','PRR (Hz):');  
               
                    cm = uicontextmenu;
                    CObject.PW.UIContextMenu = cm;
                    txt1(1)={'Enter pulse width (usec)'};
                    txt1(2)={'This is at 50% of nominal maximum amplitude'};
                    txt1(3)={'(required field)'};
                    uimenu(cm,'Label','Info','Callback',@Info_All,'UserData',txt1);
                    cm1 = uicontextmenu;
                    CObject.PRT.UIContextMenu = cm1;
                    txt2(1)={'Enter pulse rise time (usec)'};
                    txt2(2)={'This is 10% to 90% rise time'};
                    txt2(3)={'Note: for Phase Coded radars, use Chip rise time'};
                    txt2(4)={'(required field)'};
                    uimenu(cm1,'Label','Info','Callback',@Info_All,'UserData',txt2);
                    cm2 = uicontextmenu;
                    CObject.PFT.UIContextMenu = cm2;
                    txt3(1)={'Enter pulse fall time (usec).'};
                    txt3(2)={'This is 90% to 10% fall time'};
                    txt3(3)={'(required field)'};
                    uimenu(cm2,'Label','Info','Callback',@Info_All,'UserData',txt3);
                    cm3 = uicontextmenu;
                    CObject.PRR.UIContextMenu = cm3;
                    txt4(1)={'Enter pulse repetition rate (Hz)'};
                    txt4(2)={''};
                    txt4(3)={'(optional field)'};
                    uimenu(cm3,'Label','Info','Callback',@Info_All,'UserData',txt4);

end

function callbackfn(source,~)
global AppData CObject Flags

if source == CObject.PW
AppData.PW = CObject.PW.String;
end

if source ==  CObject.PRT
AppData.PRT = CObject.PRT.String;
end

if source ==  CObject.PFT
AppData.PFT = CObject.PFT.String;
end

if source ==  CObject.PRR
AppData.PRR = CObject.PRR.String;
end

if isempty(CObject.PW.String) || str2double(CObject.PW.String) == 0
    

Flags.ModSet = 0;

else
    
Flags.ModSet = 1;    

end

if isempty(CObject.PRT.String) || str2double(CObject.PRT.String) == 0
    

Flags.ModSet = 0;
CObject.mesub1.Enable = 'off';
CObject.Button.Enable = 'off'; 

else
    
Flags.ModSet = 1; 
CObject.mesub1.Enable = 'on';
CObject.Button.Enable = 'on'; 

end

if isempty(CObject.PFT.String) || str2double(CObject.PFT.String) == 0

Flags.ModSet = 0;
CObject.mesub1.Enable = 'off';
CObject.Button.Enable = 'off'; 

else
    
Flags.ModSet = 1; 
CObject.mesub1.Enable = 'on';
CObject.Button.Enable = 'on';    

end


end




