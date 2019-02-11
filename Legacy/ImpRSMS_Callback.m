function ImpRSMS_Callback(hObject, eventdata, handles)
global AppData CObject MRData Flags

IconLocation = [pwd '\Radar.png'];
AppData.ImportPath = pwd;

[AppData.DataName,AppData.ImportPath]=uigetfile('*.mat',...
                                      'Select measured data',pwd,'MultiSelect','off');

if AppData.DataName==0
   return;
end

RSMSdata = load([AppData.ImportPath '\' AppData.DataName]);

if isfield(RSMSdata,'event') 
AppData.Fm = RSMSdata.event.FreqMHz;
MRData.Fm = AppData.Fm;
else
ed = errordlg('File Format is incorrect!!','RSEC Error Msg ID2'); 
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
jframe=get(ed,'javaframe');
jIcon=javax.swing.ImageIcon(IconLocation);
jframe.setFigureIcon(jIcon); 
return
end

if isfield(RSMSdata,'EventTableData')
MRData.StartFRQ = cell2mat(RSMSdata.EventTableData(RSMSdata.EventParamIdx.fStartMHz));    
MRData.StopFRQ = cell2mat(RSMSdata.EventTableData(RSMSdata.EventParamIdx.fStopMHz)); 
MRData.RESBW = cell2mat(RSMSdata.EventTableData(RSMSdata.EventParamIdx.RBWMHz)); 
MRData.VIDBW = cell2mat(RSMSdata.EventTableData(RSMSdata.EventParamIdx.VBWMHz));    
MRData.NumPTS = cell2mat(RSMSdata.EventTableData(RSMSdata.EventParamIdx.NumSteps));
MRData.DET = cell2mat(RSMSdata.EventTableData(RSMSdata.EventParamIdx.Det));
Flags.SpecAnData = 1;
end

if isfield(RSMSdata, 'event') && isfield(RSMSdata.event, 'CalCorrectedMag')
AppData.Sm = RSMSdata.event.CalCorrectedMag - max(RSMSdata.event.CalCorrectedMag);

elseif isfield(RSMSdata, 'event') && isfield(RSMSdata.event, 'MagVect')
AppData.Sm = RSMSdata.event.MagVect - max(RSMSdata.event.MagVect);
else
    
ed = errordlg('File Format is incorrect!!','RSEC Error Msg ID3'); 
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
jframe=get(ed,'javaframe');
jIcon=javax.swing.ImageIcon(IconLocation);
jframe.setFigureIcon(jIcon); 
return
end

MRData.Sm = AppData.Sm;
Idx = find(MRData.Sm == 0,1);
AppData.FC = MRData.Fm(Idx);
FC_Butt();

CObject.ImportFileName.String = AppData.DataName;
CObject.ImportFileName.Visible = 'On';  

Flags.RSMSdata = 1;
CObject.mfsubImp.Enable = 'off';

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%