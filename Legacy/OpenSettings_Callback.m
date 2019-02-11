function OpenSettings_Callback(varargin)
global CObject AppData MRData Flags

Flags.MD = 0;

if isfield(AppData,'Fm')
MRData.Fm = AppData.Fm; 
Flags.MD = 1;
end
if isfield(AppData,'Sm')
MRData.Sm = AppData.Sm; 
Flags.MD = 1;
end



   [SysName,SysDir]=uigetfile('*.mat',...
      'Select system file',pwd,'MultiSelect','off');

if SysName==0
   return;
end

load([SysDir '\' SysName]);%#ok

if ~isfield(AppData,'FC')
ed = errordlg('This is a RSMS data file please use Import menu','Error FT01');    
waitfor(ed);
return
end

LoadAll();

CObject.Button.Enable = 'on'; 
CObject.mesub1.Enable = 'on'; 
AppData.PG = [];
AppData.N = [];
AppData.Pt = [];
AppData.XdB = [];
AppData.nSlope=[]; 
AppData.t=[]; 
AppData.tf=[]; 
AppData.tr=[]; 
AppData.ts=[];
AppData.Useage = [];
AppData.xmax=[];AppData.xmin=[];AppData.xstep=[];
AppData.ymax=[];AppData.ymin=[];AppData.ystep=[];
AppData.Bc=[];
ResBWVal();

if isfield(MRData,'Fm') || Flags.MD
AppData.Fm = MRData.Fm; 
end
if isfield(MRData,'Sm') || Flags.MD
AppData.Sm = MRData.Sm; 
end

Flags.OpenFile = 1; Flags.MD = 0;
CObject.mfsub1.Enable = 'off';
CObject.mfsub2.Enable = 'on';
return
