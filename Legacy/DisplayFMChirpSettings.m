function DisplayFMChirpSettings(RefLevel)
global CObject FigData AppData

LV = RefLevel;

    CObject.FMChirpTitle = uicontrol(CObject.Pan1,'Style', 'text', ...
                   'Position', [10,LV,250,18], ...
                   'FontSize', 9, ...
                   'FontWeight', 'bold', ...
                   'ForegroundColor','blue',...
                   'BackgroundColor',FigData.Color,...
                   'HorizontalAlignment','left',...
                   'String','FM Chirp Settings..');  
    CObject.CBW = uicontrol(CObject.Pan1,'Style', 'edit', ...
                   'Position', [120,(LV-25),50,20], ...
                   'FontSize', 8, ...
                   'BackgroundColor', 'white','Callback',@callbackfn);  
    CObject.CBWLabel = uicontrol(CObject.Pan1,'Style', 'text', ...
                   'Position', [10,(LV-25),105,18], ...
                   'FontSize', 8, ...
                   'FontWeight', 'bold', ...
                   'BackgroundColor',FigData.Color,...
                   'HorizontalAlignment','left',...
                   'String','Chirp BW (MHz):');
    CObject.RadioLin = uicontrol(CObject.Pan1,'Style', 'radiobutton', ...
                   'Callback', @myRadio, ...
                   'Units', FigData.Units, ...
                   'FontSize', 8, ...
                   'FontWeight', 'bold', ...
                   'BackgroundColor',FigData.Color,...
                   'Position', [10,(LV-45), 80, 22], ...
                   'String',   'Linear', ...
                   'Value',    1,'Callback',@callbackfn);
    CObject.RadioNonLin = uicontrol(CObject.Pan1,'Style', 'radiobutton', ...
                   'Callback', @myRadio, ...
                   'Units', FigData.Units, ...
                   'FontSize', 8, ...
                   'FontWeight', 'bold', ...
                   'BackgroundColor',FigData.Color,...
                   'Position', [90,(LV-45), 80, 22], ...
                   'String',   'Non-Linear', ...
                   'Value',    0,'Callback',@callbackfn);
               
                    cm = uicontextmenu;
                    CObject.CBW.UIContextMenu = cm;
                    txt(1)={'Enter full extent of chirp (MHz).'};
                    txt(2)={'This is not the same as the emission bandwidth'};
                    txt(3)={'(required field)'};
                    uimenu(cm,'Label','Info','Callback',@Info_All,'UserData',txt)
                    cm1 = uicontextmenu;
                    CObject.RadioLin.UIContextMenu = cm1;
                    txt(1)={'Select whether chirp is linear or non-linear, if known.'};
                    txt(2)={'For information only'};
                    txt(3)={'(optional field)'};
                    uimenu(cm1,'Label','Info','Callback',@Info_All,'UserData',txt)
                    cm2 = uicontextmenu;
                    CObject.RadioNonLin.UIContextMenu = cm2;
                    txt(1)={'Select whether chirp is linear or non-linear, if known.'};
                    txt(2)={'For information only'};
                    txt(3)={'(optional field)'};
                    uimenu(cm2,'Label','Info','Callback',@Info_All,'UserData',txt)
                    
if isfield(AppData,'RadioLinear')
CObject.RadioLin.Value = AppData.RadioLinear;
end

if isfield(AppData,'RadioNonLinear')
CObject.RadioNonLin.Value = AppData.RadioNonLinear;
end
                    
end

function callbackfn(source,~)
global AppData CObject Flags

if source ==  CObject.CBW
AppData.CBW =  CObject.CBW.String;
end

if source ==  CObject.RadioLin
CObject.RadioNonLin.Value = 0;    
AppData.RadioLinear = CObject.RadioLin.Value;
AppData.RadioNonLinear = CObject.RadioNonLin.Value;
end

if source ==  CObject.RadioNonLin
CObject.RadioLin.Value = 0;
AppData.RadioNonLinear = CObject.RadioNonLin.Value;
AppData.RadioLinear = CObject.RadioLin.Value;
end

if isempty(CObject.CBW.String) || str2double(CObject.CBW.String) == 0
    
ed = errordlg('Chirp Band Width (BW) is a required field!');
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
                    




