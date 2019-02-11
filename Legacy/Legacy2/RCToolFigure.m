function [MyTag] = RCToolFigure(varargin)
global CObject FigData Flags AppData MyHands 

MyTag = 'By Your Command Sir...';
IconLocation = [pwd '\Radar.png'];

persistent CustomFig 

Flags.case = 1; 

% This is the main figure and all the context help, as well as, the menu bar
% stuff

% Initialize Custom Figure

CustomFig = figure(...
             'Units', FigData.Units,...
             'Position', FigData.Size,...
             'NumberTitle', 'off',...
             'Resize', 'off',...
             'Name',FigData.FigMenuBar,...
             'Color',FigData.Color,...
             'MenuBar', 'none' );
         
MyHands.MainHand = CustomFig;   

SetFigIcon(CustomFig,IconLocation);        

CObject.PlotAX2 = axes(CustomFig, ...
             'Units', FigData.Units, ...
             'Position', [210 125 460 275], ...
             'Tag','Axes2',...
             'Box', 'on');
             imshow('TransLogoGrey.png'); 
             
% Create Custom Control

CObject.Button = uicontrol(CustomFig,'Style','pushbutton',...
             'FontWeight','bold',... 
             'String',FigData.ButtonText,...
             'Units', FigData.Units,...
             'BackgroundColor',FigData.ButtonColor,...
             'Callback',@StartRCT,...
             'Position',FigData.ButtonSize);             

CObject.Button.Enable = 'off'; 

ModTypes = { 'Modulation Types',...
             'CW (unmodulated)',...
             'Pulse (unmodulated)',...
             'Pulse (unmodulated w/FRQ Hop)',...
             'CW (intentional FM)',...
             'Pulse (intentional FM)',...
             'Pulse (intentional FM w/FRQ Hop)',...
             'CW (phase coded)',...
             'Pulse (phase coded)',...
             'Pulse (phase coded w/FRQ Hop)'};

CObject.Pan1 = uipanel(CustomFig,'Title','Radar Modulation Info:',...
             'BackgroundColor',FigData.Color,...
             'ForegroundColor','red',...
             'FontWeight','bold',...
             'FontSize',10, ...
             'HighlightColor',[0.53 0.32 0.32],...
             'TitlePosition','centertop',...
             'Units', FigData.Units,...
             'Position',[25 495 250 50]); 
         
CObject.PopUp1 = uicontrol(CObject.Pan1,'Style','popupmenu',...
             'FontWeight','bold',... 
             'FontSize',9, ...
             'String',ModTypes,...
             'BackgroundColor','white',...
             'Units', FigData.Units,...
             'Callback','CallModPan',...
             'Position',[20 5 205 25]); 
         
             RMI1 = uicontextmenu;
             CObject.PopUp1.UIContextMenu = RMI1;
             txt(1)={'Select the type modulation for your radar waveform.'};
             txt(2)={''};
             txt(3)={'(required field)'};
             uimenu(RMI1,'Label','Info','Callback',@Info_All,'UserData',txt);
         
CObject.Pan2 = uipanel(CustomFig,'Title','Shipboard Radar Info:',...
             'BackgroundColor',FigData.Color,...
             'ForegroundColor','k',...
             'FontWeight','bold',...
             'FontSize',10, ...
             'HighlightColor',[0.53 0.32 0.32],...
             'TitlePosition','centertop',...
             'Units', FigData.Units,...
             'Position',[280 445 258 100]);   
         
CObject.EBox1 = uicontrol(CObject.Pan2,'Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','bold',...
             'FontSize',9, ...
             'String','Radar X',...
             'Callback',@RadarName_Call,...
             'HorizontalAlignment','left',...
             'Position',[97 55 150 20]); 
         
AppData.RadarFName = CObject.EBox1.String;Flags.RNameSet = 1;         
         
CObject.SPSRadarLabel = uicontrol(CObject.Pan2,'Style', 'text', ...
             'Position', [8,57,89,16], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',FigData.Color,...
             'HorizontalAlignment','left',...
             'String','Radar Name:');  
         
             cm = uicontextmenu;
             CObject.EBox1.UIContextMenu = cm;
             txt(1)={'Enter system name'};
             txt(2)={'This is used to name the system file used in this program'};
             txt(3)={'(required field)'};
             uimenu(cm,'Label','Info','Callback',@Info_All,'UserData',txt)
                  
            Stages = { 'Select Stage >>',...
             '1- Conceptional',...
             '2- Experimental',...
             '3- Developmental',...
             '4- Operational'};
                 
CObject.SPSStageLabel = uicontrol(CObject.Pan2,'Style', 'text', ...
             'Position', [8,35,89,16], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',FigData.Color,...
             'HorizontalAlignment','left',...
             'String','Stage:');  
         
CObject.PopUp2 = uicontrol(CObject.Pan2,'Style','popupmenu',...
             'BackgroundColor','white',...
             'FontWeight','bold',...
             'FontSize',9, ...
             'String',Stages,...
             'HorizontalAlignment','left',...
             'Callback',@SetStage,...
             'Position',[97 35 150 18]);  
             cm1 = uicontextmenu;
             CObject.PopUp2.UIContextMenu = cm1;
             txt(1)={'Enter stage of system review of SPS #'};
             txt(2)={'See NTIA Manual 10.2.5'};
             txt(3)={'(optional field)'};
             uimenu(cm1,'Label','Info','Callback',@Info_All,'UserData',txt)
         
CObject.SPSLabel = uicontrol(CObject.Pan2,'Style', 'text', ...
             'Position', [8,10,89,16], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',FigData.Color,...
             'HorizontalAlignment','left',...
             'String','SPS #:');           

CObject.EBox2 = uicontrol(CObject.Pan2,'Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','bold',...
             'FontSize',9, ...
             'String','Number..',...
             'HorizontalAlignment','left',...
             'Callback',@SetSPSNum,...
             'Position',[55 9 75 18]);   
             cm2 = uicontextmenu;
             CObject.EBox2.UIContextMenu = cm2;
             txt(1)={'Enter number of latest SPS documentation'};
             txt(2)={'Hopefully this will be current certification of spectrum support'};
             txt(3)={'(optional field)'};
             uimenu(cm2,'Label','Info','Callback',@Info_All,'UserData',txt)
         
CObject.SPSDateLabel = uicontrol(CObject.Pan2,'Style', 'text', ...
             'Position', [135,10,89,16], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',FigData.Color,...
             'HorizontalAlignment','left',...
             'String','Date:');                  

CObject.EBox3 = uicontrol(CObject.Pan2,'Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','bold',...
             'FontSize',9, ...
             'String',date,...
             'HorizontalAlignment','left',...
             'Callback',@SetSPSDat,...
             'Position',[167 9 80 18]);   
             cm3 = uicontextmenu;
             CObject.EBox3.UIContextMenu = cm3;
             txt(1)={'Enter date of SPS # (mm/dd/yyyy)'};
             txt(2)={''};
             txt(3)={'(optional field)'};
             uimenu(cm3,'Label','Info','Callback',@Info_All,'UserData',txt)
                  
CObject.Pan3 = uipanel(CustomFig,'Title','Tune (MHz):',...
             'BackgroundColor',FigData.Color,...
             'ForegroundColor','k',...
             'FontWeight','bold',...
             'FontSize',10, ...
             'HighlightColor',[0.53 0.32 0.32],...
             'TitlePosition','centertop',...
             'Units', FigData.Units,...
             'Position',[545 445 130 100]);   
         
CObject.FLowLabel = uicontrol(CObject.Pan3,'Style', 'text', ...
             'Position', [5,57,89,16], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',FigData.Color,...
             'HorizontalAlignment','left',...
             'String','FRQ Low:');    
         
CObject.EBox4 = uicontrol(CObject.Pan3,'Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','normal',...
             'FontSize',8, ...
             'String','0000.00',...
             'HorizontalAlignment','left',...
             'Callback',@SetFRQLow,...
             'Position',[65 57 58 18]);   
             cm4 = uicontextmenu;
             CObject.EBox4.UIContextMenu = cm4;
             txt(1)={'Enter lower end of tuning range (MHz).'};
             txt(2)={'For information only'};
             txt(3)={'(optional field)'};
             uimenu(cm4,'Label','Info','Callback',@Info_All,'UserData',txt)
                  
CObject.FHighLabel = uicontrol(CObject.Pan3,'Style', 'text', ...
             'Position', [5,32,89,16], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',FigData.Color,...
             'HorizontalAlignment','left',...
             'String','FRQ High:');    
         
CObject.EBox5 = uicontrol(CObject.Pan3,'Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','normal',...
             'FontSize',8, ...
             'String','0000.00',...
             'HorizontalAlignment','left',...
             'Callback',@SetFRQHI,...
             'Position',[65 32 58 18]);   
             cm5 = uicontextmenu;
             CObject.EBox5.UIContextMenu = cm5;
             txt(1)={'Enter upper end of tuning range (MHz).'};
             txt(2)={'For information only'};
             txt(3)={'(optional field)'};
             uimenu(cm5,'Label','Info','Callback',@Info_All,'UserData',txt)
             
CObject.FCButt = uicontrol(CObject.Pan3,'Style', 'pushbutton', ...
             'Position', [37,7,26,22], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',FigData.Color,...
             'HorizontalAlignment','left',...
             'Callback',@FC_Butt,...
             'String','FC:');    
         
CObject.EBox6 = uicontrol(CObject.Pan3,'Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','normal',...
             'FontSize',8, ...
             'String','0000.00',...
             'HorizontalAlignment','left',...
             'Callback',@FC_Butt_Call,...
             'Position',[65 8 58 18]);   
              cm6 = uicontextmenu;
              CObject.EBox6.UIContextMenu = cm6;
              txt(1)={'Enter tuned frequency of measured data (MHz).'};
              txt(2)={'Used for RSEC mask center frequency'};
              txt(3)={'(required field)'};
              uimenu(cm6,'Label','Info','Callback',@Info_All,'UserData',txt);
              
CObject.Pan4 = uipanel(CustomFig,'Title','Misc:',...
             'BackgroundColor',FigData.Color,...
             'ForegroundColor','k',...
             'FontWeight','bold',...
             'FontSize',10, ...
             'HighlightColor',[0.53 0.32 0.32],...
             'TitlePosition','lefttop',...
             'Units', FigData.Units,...
             'Position',[682 445 200 100]);   
         
CObject.PPLabel = uicontrol(CObject.Pan4,'Style', 'text', ...
             'Position', [5,62,89,16], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',FigData.Color,...
             'HorizontalAlignment','left',...
             'String','Power (dBm):');  
         
CObject.EBox7 = uicontrol(CObject.Pan4,'Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','normal',...
             'FontSize',8, ...
             'String','000.0',...
             'HorizontalAlignment','left',...
             'Callback',@PP_Call,...
             'Position',[85 62 45 18]);   
              cm7 = uicontextmenu;
              CObject.EBox7.UIContextMenu = cm7;
              txt(1)={'Enter peak power (dBm)'};
              txt(2)={'Could be used to approximate Pt'};
              txt(3)={'(optional field)'};
              uimenu(cm7,'Label','Info','Callback',@Info_All,'UserData',txt);
              
CObject.PopUp3 = uicontrol(CObject.Pan4,'Style','popupmenu',...
             'BackgroundColor','white',...
             'FontWeight','bold',...
             'FontSize',8, ...
             'String',{'Detect','Peak','RMS'},...
             'HorizontalAlignment','left',...
             'Value',2,...
             'Callback',@SetDET,...
             'Position',[132 67 58 15]);  
             cm8 = uicontextmenu;
             CObject.PopUp3.UIContextMenu = cm8;
             txt(1)={'Select detector type used in radar measurement'};
             txt(2)={'For information only'};
             txt(3)={'(optional field)'};
             uimenu(cm8,'Label','Info','Callback',@Info_All,'UserData',txt);
             
CObject.AntLabel = uicontrol(CObject.Pan4,'Style', 'text', ...
             'Position', [5,32,89,16], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',FigData.Color,...
             'HorizontalAlignment','left',...
             'String','Antenna Gt:');  
         
CObject.EBox8 = uicontrol(CObject.Pan4,'Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','normal',...
             'FontSize',8, ...
             'String','000.0',...
             'HorizontalAlignment','left',...
             'Callback',@SetGt,...
             'Position',[85 32 45 18]);   
              cm9 = uicontextmenu;
              CObject.EBox8.UIContextMenu = cm9;
              txt(1)={'Enter main beam antenna gain (dBi)'};
              txt(2)={'For information only'};
              txt(3)={'(optional field)'};
              uimenu(cm9,'Label','Info','Callback',@Info_All,'UserData',txt);        
         
CObject.BWLabel = uicontrol(CObject.Pan4,'Style', 'text', ...
             'Position', [5,02,89,16], ...
             'FontSize', 9, ...
             'FontWeight', 'bold', ...
             'ForegroundColor','blue',...
             'BackgroundColor',FigData.Color,...
             'HorizontalAlignment','left',...
             'String','ResBW:');  
         
CObject.EBox9 = uicontrol(CObject.Pan4,'Style','edit',...
             'BackgroundColor','white',...
             'FontWeight','normal',...
             'FontSize',8, ...
             'String','000.0',...
             'HorizontalAlignment','left',...
             'Callback',@ResBWVal,...
             'Position',[85 02 45 18]);   
              cm10 = uicontextmenu;
              CObject.EBox9.UIContextMenu = cm10;
              txt(1)={'Enter resolution bandwidth used in radar measurement (MHz)'};
              txt(2)={'For information only'};
              txt(3)={'(optional field)'};
              uimenu(cm10,'Label','Info','Callback',@Info_All,'UserData',txt);     
              
CObject.Pan5 = uipanel(CustomFig,'Title','Select Usage:',...
             'BackgroundColor',FigData.Color,...
             'ForegroundColor','k',...
             'FontWeight','bold',...
             'FontSize',10, ...
             'HighlightColor',[0.53 0.32 0.32],...
             'TitlePosition','lefttop',...
             'Units', FigData.Units,...
             'Position',[585 395 200 50]);   
         
CObject.PopUp4 = uicontrol(CObject.Pan5,'Style','popupmenu',...
             'BackgroundColor','white',...
             'FontWeight','bold',...
             'FontSize',8, ...
             'String',{'Select','Radio Navigation','WPR','Fixed',...
             'Expendable or Missile','Man-Portable/Transporatable','Other'},...
             'HorizontalAlignment','left',...
             'Callback',@SetUseage,...
             'Position',[8 10 185 20]); 
             cm11 = uicontextmenu;
             CObject.PopUp4.UIContextMenu = cm11;
             txt(1)={'Enter system usage, if applicable'};
             txt(2)={'Used to determine appropriate RSEC criteria'};
             txt(3)={'(optional field)'};
             uimenu(cm11,'Label','Info','Callback',@Info_All,'UserData',txt);  
              
% Create Text label

CObject.Text = uicontrol('Style','text',...
             'FontSize',18,...
             'FontWeight','bold',...
             'BackgroundColor',FigData.Color,...
             'ForegroundColor','blue',...
             'String',FigData.Title,...
             'Units', FigData.Units,...
             'HorizontalAlignment','center',...
             'Position',FigData.TitleSize);
         
% Intialize Menubar
mf = uimenu(CustomFig,'Label','File');
mfsub0 = uimenu(mf,'Label','New','Callback',@New_1_Callback,'Accelerator','N');   %#ok<*NASGU>
CObject.mfsub1 = uimenu(mf,'Label','Open','Callback','OpenSettings_Callback','Accelerator','O');  
CObject.mfsubImpB = uimenu(mf,'Label','Import');
CObject.ImpTxt = uimenu(CObject.mfsubImpB,'Label','Text File...', ...
          'Callback',@ImpText_Callback,'Accelerator','I');
CObject.ImpRSMS = uimenu(CObject.mfsubImpB,'Label','RSMS File...', ...
          'Callback',@ImpRSMS_Callback,'Accelerator','J');
      
CObject.mfsub2 = uimenu(CObject.mfsubImpB,'Label','Manual Data','Callback',@UserDefinedWaveform,'Accelerator','M');       
mfsub3 = uimenu(mf,'Label','Save','Callback',@Save_1_Callback,'Accelerator','S');  
mfsub4 = uimenu(mf,'Label','Save As','Callback',@ SaveAs_1,'Accelerator','A');  
mfsub5 = uimenu(mf,'Label','Exit','Callback',@Exit1,'Accelerator','X');  
CObject.mfsub2.Enable = 'off';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

me = uimenu(CustomFig,'Label','Execute');

CObject.mesub1 = uimenu(me,'Label','Plot','Callback',@StartRCT,'Accelerator','L');      
CObject.mesub2 = uimenu(me,'Label','Print','Callback',@Print_1_Call,'Accelerator','P');  
CObject.mesub3 = uimenu(me,'Label','Export Figure','Callback',@Export_1,'Accelerator','E');  
CObject.mesub1.Enable = 'Off';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CObject.mm = uimenu(CustomFig,'Label','View','Callback',@PopUpPlot,'Accelerator','V');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mh = uimenu(CustomFig,'Label','Help'); 

mhsub1 = uimenu(mh,'Label','About RCP','Callback',@AboutRSEC,'Accelerator','H');      

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SetFigIcon(CustomFig,IconLocation);

CObject.MyFigMain = CustomFig; %Set the hands twice.. need to fix this
CObject.mm.Enable = 'Off';  

return



