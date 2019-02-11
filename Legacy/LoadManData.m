function LoadManData(varargin)
global state AppData Flags

[baseName, folder] = uigetfile('*.mat','Select the Manual Data file to load');
fileName = fullfile(folder, baseName);
fileTest = isnumeric(baseName);

if fileTest == 1  %check for file name or cancel was used..
    WarningMess = 'The Emitter File Load was Canceled!!!';
    wd = warndlg(WarningMess);
    SetFigIcon(wd,'Radar.png');   
    waitfor(wd);
    return
else
    
    load(fileName,'state');
    varargin{1,3}.FRQ_3dBHighMHz.String = state.TXF_1;
    varargin{1,3}.FRQ_3dBLowMHz.String = state.TXF_2;
    varargin{1,3}.FRQ_20dBHighMHz.String = state.TXF_3;
    varargin{1,3}.FRQ_20dBLowMHz.String = state.TXF_4;
    varargin{1,3}.FRQ_40dBHighMHz.String = state.TXF_5;
    varargin{1,3}.FRQ_40dBLowMHz.String = state.TXF_6;
    varargin{1,3}.FRQ_60dBHighMHz.String = state.TXF_7;
    varargin{1,3}.FRQ_60dBLowMHz.String = state.TXF_8; 
    varargin{1,3}.SpurLeveldB.String = state.TXL_SPL;
    varargin{1,3}.Level2HarmdB.String = state.TXL_HL2;
    varargin{1,3}.Level3HarmdB.String = state.TXL_HL3;
    varargin{1,3}.LevelOTHdB.String = state.TXL_HLO;
    Flags.MorKSwitch = state.MorKSwitch;
    
    if Flags.MorKSwitch
    FAC = 0.001;
    varargin{1,3}.radiobutton5.Value = 0;
    varargin{1,3}.radiobutton6.Value = 1;
    else
    FAC = 1;
    end
    
    varargin{1,3}.radiobutton5.Enable = 'off';
    varargin{1,3}.radiobutton6.Enable = 'off';
    
    if ischar(AppData.FC)
    AppData.FC = str2double(AppData.FC);
    end
    
    AppData.L3dBPtMhz =  AppData.FC - str2double(state.TXF_2)*FAC;
    AppData.L20dBPtMhz = AppData.FC - str2double(state.TXF_4)*FAC;
    AppData.L40dBPtMhz = AppData.FC - str2double(state.TXF_6)*FAC;
    AppData.L60dBPtMhz = AppData.FC - str2double(state.TXF_8)*FAC;
    AppData.H3dBPtMhz =  AppData.FC + str2double(state.TXF_1)*FAC;
    AppData.H20dBPtMhz = AppData.FC + str2double(state.TXF_3)*FAC;
    AppData.H40dBPtMhz = AppData.FC + str2double(state.TXF_5)*FAC;
    AppData.H60dBPtMhz = AppData.FC + str2double(state.TXF_7)*FAC;
    
    
    AppData.SpurLevdB = str2double(varargin{1,3}.SpurLeveldB.String);
    AppData.Lev2HarmdB = str2double(varargin{1,3}.Level2HarmdB.String);
    AppData.Lev3HarmdB = str2double(varargin{1,3}.Level3HarmdB.String);
    AppData.LevOTHdB = str2double(varargin{1,3}.LevelOTHdB.String);
    
    Flags.Loaded = 1;
   
end

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%