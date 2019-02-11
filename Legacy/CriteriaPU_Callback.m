function CriteriaPU_Callback(hObject, eventdata, handles)
global AppData CObject

contents = get(hObject,'String');
AppData.Criteria = cell2mat(contents(get(hObject,'Value')));

if sum(strcmp(AppData.Criteria,{'','F'}))
   AppData.bwRSECn=[];
   set(CObject.BWCnEB1,'string',num2str(AppData.bwRSECn));
   AppData.nSlope=0;
   set(CObject.SlopeB1,'string',num2str(AppData.nSlope));
else
    
    if isempty(AppData.bwRSECn)
       AppData.bwRSECn = newRSECbw(AppData);
       CObject.BW40EB1.String = num2str(AppData.bwRSECn);
    end
   
   if AppData.nSlope==0
      if strcmp(AppData.Criteria,'D')
         AppData.nSlope=40;
      else
         AppData.nSlope=30;
      end
      set(AppData.slope1,'string',num2str(AppData.nSlope));
   end
end

AppData.bwRSECo = oldRSECbw(AppData);
N = CObject.CPU.Value;

switch N
    case 1
    AppData.RSECcrit = 'A';
    case 2
    AppData.RSECcrit = 'B';
    case 3
    AppData.RSECcrit = 'C';
    case 4
    AppData.RSECcrit = 'D';  
    case 5
    AppData.RSECcrit = 'E';
    case 6
    AppData.RSECcrit = 'F';
end
        
updateMask(AppData);

return



