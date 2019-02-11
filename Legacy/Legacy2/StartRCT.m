function StartRCT(varargin)
global CObject MRData Flags 

% Call Create plot script which also runs the RSEC mask selection app

CreateFigPlot;
CObject.PlotFig.Visible = 'On';    
CObject.Button.Enable = 'Off'; 

if ~Flags.TextData
CObject.ImportFileName.String = '';
CObject.ImportFileName.Visible = 'Off'; 
else
CObject.ImportFileName.String = MRData.DataName;
CObject.ImportFileName.Visible = 'On';
CObject.mfsubImp.Enable = 'off';    
end

if Flags.ManData
CObject.ImportFileName.String = MRData.DType;
CObject.ImportFileName.Visible = 'On';
CObject.mfsubImp.Enable = 'off';    
end

disp('System Run Complete');    
Flags.Page = 1;    
return