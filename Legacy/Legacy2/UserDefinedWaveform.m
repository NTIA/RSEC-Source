function varargout = UserDefinedWaveform(varargin)
% Last Modified by GUIDE v2.5 31-Jan-2018 11:37:07
% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UserDefinedWaveform_OpeningFcn, ...
                   'gui_OutputFcn',  @UserDefinedWaveform_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before UserDefinedWaveform is made visible.
function UserDefinedWaveform_OpeningFcn(hObject,~, handles, varargin)
global AppData Flags 

IconLocation = [pwd '\Radar.png'];

AppData.L3dBPtMhz = str2double(handles.FRQ_3dBLowMHz.String);
AppData.L20dBPtMhz = str2double(handles.FRQ_20dBLowMHz.String);
AppData.L40dBPtMhz = str2double(handles.FRQ_40dBLowMHz.String);
AppData.L60dBPtMhz = str2double(handles.FRQ_60dBLowMHz.String);
AppData.H3dBPtMhz = str2double(handles.FRQ_3dBHighMHz.String);
AppData.H20dBPtMhz = str2double(handles.FRQ_20dBHighMHz.String);
AppData.H40dBPtMhz = str2double(handles.FRQ_40dBHighMHz.String);
AppData.H60dBPtMhz = str2double(handles.FRQ_60dBHighMHz.String);
AppData.SpurLevdB = str2double(handles.SpurLeveldB.String);
AppData.Lev2HarmdB = str2double(handles.Level2HarmdB.String);
AppData.Lev3HarmdB = str2double(handles.Level3HarmdB.String);
AppData.LevOTHdB = str2double(handles.LevelOTHdB.String);

if ~isfield(AppData,'FC')
AppData.FC = (AppData.L3dBPtMhz + AppData.H3dBPtMhz)/2;
end

% Inserts Custom Icon on title bar of figure

warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
jframe=get(handles.UDW,'javaframe');
jIcon=javax.swing.ImageIcon(IconLocation);
jframe.setFigureIcon(jIcon);        

guidata(hObject, handles);

%Assumes Symetry
Flags.SymWave = 1;Flags.MorKSwitch = 0;Flags.Loaded = 0;
handles.FRQ_3dBHighMHz.Enable = 'off';
handles.FRQ_20dBHighMHz.Enable = 'off';
handles.FRQ_40dBHighMHz.Enable = 'off';
handles.FRQ_60dBHighMHz.Enable = 'off';

return

% --- Outputs from this function are returned to the command line.
function varargout = UserDefinedWaveform_OutputFcn(hObject,~, handles) 
handles.output = hObject;
varargout{1} = handles.output;
return

% --- Executes on button press in PB1.
function PB1_Callback(varargin)
global AppData CObject Flags MRData

Flags.ManData = 1;
MRData.DType = '';

if ~isfield(AppData,'FC')
AppData.FC = (AppData.L3dBPtMhz + AppData.H3dBPtMhz)/2;
end

if varargin{1,3}.DataTypeCal.Value == 1
   MRData.DType = 'Calculated';
elseif varargin{1,3}.DataTypeMeasured.Value == 1
   MRData.DType = 'Measured';
end


[AppData.Fm,AppData.Sm]= MakeLinearSpectrum(AppData,Flags);

% figure
% plot(AppData.Fm,AppData.Sm);

Flags.Mandata = 1;
CObject.mfsubImpB.Enable = 'off';
CObject.mfsub2.Enable = 'off';
close(UserDefinedWaveform);

if Flags.Page
CObject.ImportFileName.String = MRData.DType;
CObject.ImportFileName.Visible = 'on';
end

FC_Butt();
return

function FRQ_3dBLowMHz_Callback(varargin)
global AppData Flags

if Flags.MorKSwitch
FAC = 0.001;
else
FAC = 1;
end

if ischar(AppData.FC)
AppData.FC = str2double(AppData.FC);
end

AppData.L3dBPtMhz = AppData.FC - (str2double(varargin{1}.String)*FAC);

if Flags.SymWave
AppData.H3dBPtMhz = AppData.FC + (str2double(varargin{1}.String)*FAC);
varargin{1,3}.FRQ_3dBHighMHz.String = varargin{1}.String;
end

varargin{1,3}.radiobutton5.Enable = 'off';
varargin{1,3}.radiobutton6.Enable = 'off';

return

% --- Executes during object creation, after setting all properties.
function FRQ_3dBLowMHz_CreateFcn(hObject, ~, ~)
%This is the objects properties that are not linked to the fig
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
return

function FRQ_3dBHighMHz_Callback(varargin)
global AppData Flags

if Flags.MorKSwitch
FAC = 0.001;
else
FAC = 1;
end

if ischar(AppData.FC)
AppData.FC = str2double(AppData.FC);
end

AppData.H3dBPtMhz = AppData.FC + (str2double(varargin{1}.String)*FAC);

% AppData.H3dBPtMhz = (str2double(varargin{1}.String)*FAC);

varargin{1,3}.radiobutton5.Enable = 'off';
varargin{1,3}.radiobutton6.Enable = 'off';
return

% --- Executes during object creation, after setting all properties.
function FRQ_3dBHighMHz_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
return

function FRQ_20dBLowMHz_Callback(varargin)
global AppData Flags

if Flags.MorKSwitch
FAC = 0.001;
else
FAC = 1;
end

if ischar(AppData.FC)
AppData.FC = str2double(AppData.FC);
end

AppData.L20dBPtMhz = AppData.FC - (str2double(varargin{1}.String)*FAC);

if Flags.SymWave
AppData.H20dBPtMhz = AppData.FC + (str2double(varargin{1}.String)*FAC);
varargin{1,3}.FRQ_20dBHighMHz.String = varargin{1}.String;
end

varargin{1,3}.radiobutton5.Enable = 'off';
varargin{1,3}.radiobutton6.Enable = 'off';
return

% --- Executes during object creation, after setting all properties.
function FRQ_20dBLowMHz_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
   set(hObject,'BackgroundColor','white');
end
return

function FRQ_20dBHighMHz_Callback(varargin)
global AppData Flags

if Flags.MorKSwitch
FAC = 0.001;
else
FAC = 1;
end

if ischar(AppData.FC)
AppData.FC = str2double(AppData.FC);
end

AppData.H20dBPtMhz = AppData.FC + (str2double(varargin{1}.String)*FAC);

varargin{1,3}.radiobutton5.Enable = 'off';
varargin{1,3}.radiobutton6.Enable = 'off';
return

% --- Executes during object creation, after setting all properties.
function FRQ_20dBHighMHz_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
   set(hObject,'BackgroundColor','white');
end
return

function FRQ_40dBLowMHz_Callback(varargin)
global AppData Flags

if Flags.MorKSwitch
FAC = 0.001;
else
FAC = 1;
end

if ischar(AppData.FC)
AppData.FC = str2double(AppData.FC);
end

AppData.L40dBPtMhz = AppData.FC - (str2double(varargin{1}.String)*FAC);

if Flags.SymWave
AppData.H40dBPtMhz = AppData.FC + (str2double(varargin{1}.String)*FAC);
varargin{1,3}.FRQ_40dBHighMHz.String = varargin{1}.String;
end

varargin{1,3}.radiobutton5.Enable = 'off';
varargin{1,3}.radiobutton6.Enable = 'off';
return

% --- Executes during object creation, after setting all properties.
function FRQ_40dBLowMHz_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
   set(hObject,'BackgroundColor','white');
end
return

function FRQ_40dBHighMHz_Callback(varargin)
global AppData Flags

if Flags.MorKSwitch
FAC = 0.001;
else
FAC = 1;
end

if ischar(AppData.FC)
AppData.FC = str2double(AppData.FC);
end

AppData.H40dBPtMhz = AppData.FC + str2double(varargin{1}.String)*FAC;

varargin{1,3}.radiobutton5.Enable = 'off';
varargin{1,3}.radiobutton6.Enable = 'off';
return

% --- Executes during object creation, after setting all properties.
function FRQ_40dBHighMHz_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
return

function FRQ_60dBLowMHz_Callback(varargin)
global AppData Flags

if Flags.MorKSwitch
FAC = 0.001;
else
FAC = 1;
end

if ischar(AppData.FC)
AppData.FC = str2double(AppData.FC);
end

AppData.L60dBPtMhz = AppData.FC - (str2double(varargin{1}.String)*FAC);

if Flags.SymWave
AppData.H60dBPtMhz = AppData.FC + (str2double(varargin{1}.String)*FAC);
varargin{1,3}.FRQ_60dBHighMHz.String = varargin{1}.String;
end

varargin{1,3}.radiobutton5.Enable = 'off';
varargin{1,3}.radiobutton6.Enable = 'off';
return

% --- Executes during object creation, after setting all properties.
function FRQ_60dBLowMHz_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
return

function FRQ_60dBHighMHz_Callback(varargin)
global AppData Flags

if Flags.MorKSwitch
FAC = 0.001;
else
FAC = 1;
end

if ischar(AppData.FC)
AppData.FC = str2double(AppData.FC);
end

AppData.H60dBPtMhz = AppData.FC + (str2double(varargin{1}.String)*FAC);

varargin{1,3}.radiobutton5.Enable = 'off';
varargin{1,3}.radiobutton6.Enable = 'off';
return

% --- Executes during object creation, after setting all properties.
function FRQ_60dBHighMHz_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
return

function SpurLeveldB_Callback(varargin)
global AppData
AppData.SpurLevdB = str2double(varargin{1}.String);
return

% --- Executes during object creation, after setting all properties.
function SpurLeveldB_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
return

function Level2HarmdB_Callback(varargin)
global AppData
AppData.Lev2HarmdB = str2double(varargin{1}.String);
return

% --- Executes during object creation, after setting all properties.
function Level2HarmdB_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
return

function Level3HarmdB_Callback(varargin)
global AppData
AppData.Lev3HarmdB = str2double(varargin{1}.String);
return

% --- Executes during object creation, after setting all properties.
function Level3HarmdB_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
return

function LevelOTHdB_Callback(varargin)
global AppData
AppData.LevOTHdB = str2double(varargin{1}.String);
return

% --- Executes during object creation, after setting all properties.
function LevelOTHdB_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(varargin) %#ok<*DEFNU>
global Flags

varargin{1,3}.FRQ_3dBHighMHz.Enable = 'off';
varargin{1,3}.FRQ_20dBHighMHz.Enable = 'off';
varargin{1,3}.FRQ_40dBHighMHz.Enable = 'off';
varargin{1,3}.FRQ_60dBHighMHz.Enable = 'off';

Flags.SymWave = 1;

return


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(varargin)
global Flags;

varargin{1,3}.FRQ_3dBHighMHz.Enable = 'on';
varargin{1,3}.FRQ_20dBHighMHz.Enable = 'on';
varargin{1,3}.FRQ_40dBHighMHz.Enable = 'on';
varargin{1,3}.FRQ_60dBHighMHz.Enable = 'on';

Flags.SymWave = 0;
return


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(varargin)
global Flags

Flags.MorKSwitch = 0;

return


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(varargin)
global Flags

Flags.MorKSwitch = 1;


return


% --------------------------------------------------------------------
function BarTab1_Callback(varargin)
% --------------------------------------------------------------------

function Save_1_Callback(varargin)

SaveManData(varargin{:});

return


% --------------------------------------------------------------------
function Load_1_Callback(varargin)

LoadManData(varargin{:});

return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
