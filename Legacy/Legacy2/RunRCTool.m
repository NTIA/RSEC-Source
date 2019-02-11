function RunRCTool()
%Create Script file ***This is the Program Start!!!!***
clear all; %#ok

global FigData progdata ITM Flags AppData MRData

clc

%Initialize Flags 

Flags.case = 0;
Flags.PageFlag = 0;
Flags.CustomPage = 1;
Flags.SpecAnData = 0;
Flags.GoGo = 0;
Flags.RSMSdata = 0;
Flags.ModSet = 0;
Flags.FCSet = 0;
Flags.RNameSet = 0;
Flags.RSEC_A1 = 0;
Flags.TextData = 0;
Flags.ManData = 0;
Flags.ModData = 0;
Flags.Page = 0;
Flags.ViewOnly = 0;
Flags.LegacyHold = 0;
Flags.RC = 0;Flags.CSW = 0;
Flags.OverUnder = 0;

%and Startup Varibles

AppData.Criteria = [];
AppData.Bs = [];
AppData.PG = [];
AppData.xmin1 = [];
AppData.xmax1 = [];
AppData.ModT = [];
AppData.ImportPath = [];
AppData.Fm = [];
AppData.Sm = [];
AppData.oo = [];
AppData.uu = [];
AppData.CBW = [];


AppData.FRQLow = '0000.0';
AppData.FRQHi = '0000.0';
MRData.PHCNum = [];
MRData.SPSNumb = [];
MRData.bw40 = [];
MRData.bwXdB = [];
MRData.DType = '';

AppData.OutDir = 0; 

%Load some common figure stuff

FigData.Title = 'NTIA RSEC Compliance Program (RCP)';
FigData.Color = [.9 .9 .9 ];
FigData.Tag = 'RCT_Main';
FigData.Units = 'Pixels';
FigData.Size = [380 150 905 600];
FigData.FigMenuBar = 'Compliance Tools by OSM NTIA';

FigData.ButtonText = 'Run RSEC Compliance Analysis >>';
FigData.ButtonColor = [.87 .92 .98];
FigData.ButtonSize = [340 65 200 25];
FigData.ButtonUnits = 'characters';
FigData.Note = 'The appropriate RSEC Mask will be selected...';
FigData.NoteSize = [2.5 33 875 25];
FigData.NoteFontSize = 10;
FigData.NoteFontAngle = 'italic';
FigData.PBarHeight = 0.05;
FigData.TitleSize = [2.5 570 905 30];
FigData.ProcessMessage = 'Running REC Compliance...';
FigData.Note2 = 'Note: Enter Measured Data to do a complete analysis...';
FigData.NoteSize2 = [2.5 545 905 16];

progdata.fractiondone = 0.1;

Load_SEAD_DLL ()
ITM = Load_ITM_Parameters();

RCToolFigure(); %Create Figure

%%%%%%%%%%%%%%%%%%%%%%%%%%%% FIN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%