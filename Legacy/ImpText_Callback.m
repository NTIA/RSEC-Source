function ImpText_Callback(varargin)
% Imports Measured Data from Text file
global AppData CObject MRData Flags

[MRData.DataName,AppData.ImportPath]=uigetfile('*.txt',...
      'Select measured data',pwd,'MultiSelect','off');

if MRData.DataName==0
   return;
end

data = load([AppData.ImportPath MRData.DataName]);
AppData.Fm=data(:,1);
AppData.Sm=data(:,2)-max(data(:,2));
MRData.Fm = AppData.Fm;
MRData.Sm = AppData.Sm;
Idx = find(MRData.Sm == 0,1);
AppData.FC = MRData.Fm(Idx);

Flags.TextData = 1;
CObject.mfsubImpB.Enable = 'off';

if Flags.Page
CObject.mfsubImp.Enable = 'off';
end

CObject.mm.Enable = 'On';

return
