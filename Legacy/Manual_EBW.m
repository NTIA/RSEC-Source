function varargout = Manual_EBW(varargin)
% MANUAL_EBW M-file for Manual_EBW.fig
%      MANUAL_EBW, by itself, creates a new MANUAL_EBW or raises the existing
%      singleton*.
%
%      H = MANUAL_EBW returns the handle to a new MANUAL_EBW or the handle to
%      the existing singleton*.
%
%      MANUAL_EBW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANUAL_EBW.M with the given input arguments.
%
%      MANUAL_EBW('Property','Value',...) creates a new MANUAL_EBW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Manual_EBW_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Manual_EBW_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Manual_EBW

% Last Modified by GUIDE v2.5 13-Apr-2009 10:48:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Manual_EBW_OpeningFcn, ...
                   'gui_OutputFcn',  @Manual_EBW_OutputFcn, ...
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


% --- Executes just before Manual_EBW is made visible.
function Manual_EBW_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Manual_EBW (see VARARGIN)

% Choose default command line output for Manual_EBW

handles.output = hObject;
handles.oldfigure = varargin{:};
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Manual_EBW_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% ----------------------------------------------------------------------

% --- Executes when user attempts to close figure.
function Manual_EBW_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.str = get(handles.MEBW_3dBL_ET,'String');
handlesold = handles.oldfigure;
% get(handlesold,'Children')
set(handlesold.APP_ET_BWres,'String',handles.str);
guidata(handlesold.Manual_EBW,handlesold);
delete(hObject);

%% ----------------------------------------------------------------------

function MEBW_3dBL_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_3dBL_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_3dBL_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_3dBL_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_3dBL_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_3dBL_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','1213');
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% ----------------------------------------------------------------------

function MEBW_3dBU_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_3dBU_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_3dBU_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_3dBU_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_3dBU_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_3dBU_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','1216');

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% ----------------------------------------------------------------------

function MEBW_20dBL_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_20dBL_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_20dBL_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_20dBL_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_20dBL_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_20dBL_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','1210');

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% ----------------------------------------------------------------------

function MEBW_20dBU_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_20dBU_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_20dBU_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_20dBU_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_20dBU_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_20dBU_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','1218');

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% ----------------------------------------------------------------------

function MEBW_40dBL_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_40dBL_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_40dBL_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_40dBL_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_40dBL_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_40dBL_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','1203');

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% ----------------------------------------------------------------------

function MEBW_40dBU_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_40dBU_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_40dBU_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_40dBU_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_40dBU_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_40dBU_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','1224');

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% ----------------------------------------------------------------------

function MEBW_60dBL_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_60dBL_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_60dBL_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_60dBL_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_60dBL_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_60dBL_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','1185');

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% ----------------------------------------------------------------------

function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% ----------------------------------------------------------------------

function MEBW_60dBU_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_60dBU_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_60dBU_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_60dBU_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_60dBU_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_60dBU_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','1234');

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% ----------------------------------------------------------------------

function MEBW_Spur_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_Spur_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_Spur_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_Spur_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_Spur_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_Spur_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'string','-65');

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% ----------------------------------------------------------------------

function MEBW_2Harm_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_2Harm_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_2Harm_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_2Harm_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_2Harm_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_2Harm_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% -------------------------------------------------------------------

function MEBW_3Harm_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_3Harm_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_3Harm_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_3Harm_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_3Harm_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_3Harm_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% --------------------------------------------------------------------

function MEBW_OHarm_ET_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_OHarm_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MEBW_OHarm_ET as text
%        str2double(get(hObject,'String')) returns contents of MEBW_OHarm_ET as a double


% --- Executes during object creation, after setting all properties.
function MEBW_OHarm_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MEBW_OHarm_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



%% --- Executes on button press in MEBW_Meas_RB.
function MEBW_Meas_RB_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_Meas_RB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MEBW_Meas_RB


%% --- Executes on button press in MEBW_OK_PB.
function MEBW_OK_PB_Callback(hObject, eventdata, handles)
% hObject    handle to MEBW_OK_PB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Pulls all data in lumped array

MEBWdata = get(handles.Man_EBW_FIG, 'Children'); 
handlesold = handles.oldfigure;

% Set Spectrum Data to 'Manual Data - Calculated' or ' - Measured'

if get(findobj(MEBWdata, 'Tag', 'MEBW_Calc_RB'), 'Value') == 1
    MEBWDataName = 'Calculated';
elseif get(findobj(MEBWdata, 'Tag', 'MEBW_Meas_RB'), 'Value') == 1
    MEBWDataName = 'Measured';
end
    
set(handlesold.APP_ST_DataName,'string', ['Manual Data - ' MEBWDataName]);


% Use edit text data to make plot Freq (Fm) and Power (Sm) matricies
% ------------------------------------------------------------------

% Getting Emission Bandwidth Levels

Fcent = str2double(get(handlesold.APP_ET_CenterFreq, 'String'));
F3dBL = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_3dBL_ET'), 'String'));
F3dBU = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_3dBU_ET'), 'String'));
F20dBL = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_20dBL_ET'), 'String'));
F20dBU = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_20dBU_ET'), 'String'));
F40dBL = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_40dBL_ET'), 'String'));
F40dBU = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_40dBU_ET'), 'String'));
F60dBL = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_60dBL_ET'), 'String'));
F60dBU = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_60dBU_ET'), 'String'));


% Assigning upper and lower plot noise floor limits

FSpurL = F60dBL - 100;
FSpurU = F60dBU + 100;


% Getting Spurious & Harmonic Levels
SSpur = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_Spur_ET'), 'String'));
S2Harm = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_2Harm_ET'), 'String'));
S3Harm = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_3Harm_ET'), 'String'));
SOHarm = str2double(get(findobj(MEBWdata, 'Tag', 'MEBW_OHarm_ET'), 'String'));


% Choosing highest Spurious/Harmonic level for plot noise floor

if isempty(SSpur)   % Default -65 if empty; overwrite any old data
    SSpur = -65;
end

if S2Harm > SSpur
    SSpur = S2Harm;
end

if S3Harm > SSpur
    SSpur = S3Harm;
end

if SOHarm > SSpur
    SSpur = SOHarm;
end

if isempty(SSpur)   % Default -65 if any are empty
    SSpur = -65;
end

% Assign plot Frequency and Power Level data

% Fm = [FSpurL F60dBL F40dBL F20dBL F3dBL Fcent F3dBU F20dBU F40dBU...
%    F60dBU FSpurU];
Sm = [SSpur -60 -40 -20 -3 0 -3 -20 -40 -60 SSpur];


F1 = (FSpurL:1:F60dBL-1);
F2 = (F60dBL:1:F40dBL-1);
F3 = (F40dBL:1:F20dBL-1);
F4 = (F20dBL:1:F3dBL-1);
F5 = (F3dBL:1:Fcent-1);
F6 = (Fcent:1:F3dBU-1);
F7 = (F3dBU:1:F20dBU-1);
F8 = (F20dBU:1:F40dBU-1);
F9 = (F40dBU:1:F60dBU-1);
F10 = (F60dBU:1:FSpurU);

%S1 = (SSpur:1:-60)
%lf1 = length(F1)
%ls1 = length(S1)
%n1 = length(S1)/length(F1)
%S1 = (SSpur:n1:-60)
%lf = length(F1)
%ls = length(S1)

%S2 = (-60:1:-41)
%lf2 = length(F2)
%ls2 = length(S2)
%n2 = length(S2)/length(F2)
%S2 = (SSpur:n2:-60)
%lf2 = length(F2)
%ls2 = length(S2)

%S3 = (-40:1:-21);
%S4 = (-20:1:-4);
%S5 = (-3:1:-1);
%S6 = (-3:1:0);
%S6 = fliplr(S6);
%S7 = fliplr(S4);
%S8 = fliplr(S3);
%S9 = fliplr(S2);
%S10 = fliplr(S1);

Fm = [F1 F2 F3 F4 F5 F6 F7 F8 F9 F10];

%Sm = [S1 S2 S3 S4 S5 S6 S7 S8 S9 S10];
%Sm = Sm-max(Sm); 

Lf = length(Fm)
r = Lf/11
r = round(r)
Sm = interp(Sm, r);
Ls = length(Sm);

handlesold.Fm = Fm;
handlesold.Sm = Sm;

guidata(handlesold.APP_RadarDataFig,handlesold);

close;
