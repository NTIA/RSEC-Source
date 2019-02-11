function Exit1(varargin)
global AppData

myicon = imread('Quest.png');


if ~(isempty(AppData.ModT) || isempty(AppData.RadarFName))
   fstring(1)={'Do you want to save the System file?'};
   button = buttondlg(fstring,'Save System file','Yes','No',struct('Default','No','IconString','custom',...
                              'IconData',myicon));
   
 
   if strcmp(button,'Yes')
      Save_1_Callback(varargin(1), varargin(2), AppData);
   end
   
end
close;