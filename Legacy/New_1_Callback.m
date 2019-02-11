function New_1_Callback(varargin)
global AppData 

if ~(isempty(AppData.ModT) || isempty(AppData.RadarFName))
   Save_1_Callback;
end

% clearvars AppData Flags

ReNewFig;


return