function SaveManData(varargin)
global state Flags

[baseName, folder] = uiputfile('MyManData.mat','Save your Manual Data as ***'); %need to create code for a cancel...
fileName = fullfile(folder, baseName);
fileTest = isnumeric(baseName);

if fileTest == 1 %check for file name or cancel was used..
    WarningMess = 'The Emitter File Save was Canceled!!!';
    wd = warndlg(WarningMess);
    SetFigIcon(wd,'Radar.png'); 
    waitfor(wd);
    return
   
else
state.TXF_1 = varargin{1,3}.FRQ_3dBHighMHz.String;
state.TXF_2 = varargin{1,3}.FRQ_3dBLowMHz.String;
state.TXF_3 = varargin{1,3}.FRQ_20dBHighMHz.String;
state.TXF_4 = varargin{1,3}.FRQ_20dBLowMHz.String;
state.TXF_5 = varargin{1,3}.FRQ_40dBHighMHz.String;
state.TXF_6 = varargin{1,3}.FRQ_40dBLowMHz.String;
state.TXF_7 = varargin{1,3}.FRQ_60dBHighMHz.String;
state.TXF_8 = varargin{1,3}.FRQ_60dBLowMHz.String;
state.TXL_SPL = varargin{1,3}.SpurLeveldB.String;
state.TXL_HL2 = varargin{1,3}.Level2HarmdB.String;
state.TXL_HL3 = varargin{1,3}.Level3HarmdB.String;
state.TXL_HLO = varargin{1,3}.LevelOTHdB.String;
state.MorKSwitch = Flags.MorKSwitch;

save (fileName,'state');

end

return
%call this funtion to save emitter parameters in their own file