%script file to make new
global CObject FigData AppData Flags MRData 

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

CObject.PopUp1.Value = 1;
CObject.PopUp2.Value = 1;
CObject.PopUp3.Value = 1;
CObject.PopUp4.Value = 1;
CObject.EBox1.String = 'Radar X';
CObject.EBox2.String = 'Number..';
CObject.EBox3.String = date;
CObject.EBox4.String = '0000.00';
CObject.EBox5.String = '0000.00';
CObject.EBox6.String ='0000.00';
CObject.EBox7.String = '000.0';
CObject.EBox8.String = '000.0';
CObject.EBox9.String ='000.0';
AppData.ImportPath = [];
AppData.DataName = [];
Flags.RSMSdata = 0;
Flags.TextData = 0;
AppData.Sm = [];
AppData.Fm = [];

if Flags.PageFlag 
StartRCT();
end

if isfield(CObject,'PlotAX1')
    if isvalid(CObject.PlotAX1)
    cla(CObject.PlotAX1);
    end
end

% CObject.PlotAX1.Visible = 'Off';
CObject.Button.String = FigData.ButtonText;
CObject.Button.Enable = 'off'; 
CObject.mesub1.Enable = 'off';
CObject.mfsub1.Enable = 'on';
CObject.mfsub2.Enable = 'off';
CObject.mfsubImpB.Enable = 'on';
CObject.PopUp1.Value = 1;

CObject.EBox6.String = '0000.00';
AppData.Criteria = [];
AppData.Bs = [];
AppData.PG = [];
AppData.xmin1 = [];
AppData.xmax1 = [];
AppData.ModT = [];
AppData.ImportPath = [];
Flags.PageFlag = 0;
Flags.CustomPage = 1;

% FigData.Title = 'NTIA RSEC Compliance Tool (RCT)';
% FigData.Color = [.94 .87 .87 ];
% FigData.Tag = 'RCT_Main';
% FigData.Units = 'Pixels';
% FigData.Size = [400 350 905 600];
% FigData.FigMenuBar = 'Compliance Tools by OSM NTIA';
% FigData.ButtonText = 'Run RSEC Compliance Analysis >>';
% FigData.ButtonColor = [.87 .92 .98];
% FigData.ButtonSize = [340 65 200 25];
% FigData.ButtonUnits = 'characters';
% FigData.Note = 'The appropriate RSEC Mask will be selected...';
% FigData.NoteSize = [2.5 33 875 25];
% FigData.NoteFontSize = 10;
% FigData.NoteFontAngle = 'italic';
% FigData.PBarHeight = 0.05;
% FigData.TitleSize = [2.5 570 905 30];
% FigData.ProcessMessage = 'Running REC Compliance...';
% FigData.Note2 = 'Note: Enter Waveform Data to enable analysis...';
% FigData.NoteSize2 = [2.5 545 905 18];

CallModPan()

% if isfield(AppData,'htitle')
% TitleDog(1);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

