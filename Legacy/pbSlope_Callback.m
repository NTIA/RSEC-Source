function pbSlope_Callback(hObject, eventdata, handles)
global AppData CObject

if strcmp(AppData.Criteria,'D')
   AppData.nSlope=40;
elseif sum(strcmp(AppData.Criteria,{'A' 'F' ''}))
   AppData.nSlope=0;
elseif isempty(AppData.Criteria)
   AppData.nSlope=0;
else
   AppData.nSlope=30;
end

CObject.SlopeB1.String = num2str(AppData.nSlope);

updateMask(AppData);

CObject.Slope.Value = 0;

refresh;

return