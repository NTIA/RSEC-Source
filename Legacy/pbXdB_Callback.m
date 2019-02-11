function pbXdB_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.XdB = getXdB(AppData);
CObject.XdB1.String = num2str(AppData.XdB);
updateMask(AppData);
CObject.Xdb.Value = 0;
refresh;

return


function X=getXdB(h)
if isempty(h.Criteria)
   X=[];
   return
end
switch h.Criteria
   case 'A' 
     switch h.ModType
       case {3,4,6,7,9,10}
          X=max(60,h.Pt+30);
       case {2,5,8}
          X=40;
       otherwise
          X=[];
      end
    
   case 'B'
      switch strtok(h.ModType,'-')
         case {3,4,6,7,9,10}
            X=max(60,h.Pt+30);
         case {2,5,8}
            X=60;
         otherwise
            X=[];
      end
   case 'C'
      switch strtok(h.ModType,'-')
         case {3,4,6,7,9,10}
            X=max(60,h.Pt+30);
         case {2,5,8}
            X=60;
         otherwise
            X=[];
      end
   case 'D'
      switch h.ModT
         case {'Pulse No Mod','Pulse No Mod/FHop','Pulse/FM',...
               'Pulse/FM FHop','Pulse/PC','Pulse/PC FHop'}
               X=80;
         case {'CW No Mod','CW/FM','CW/PC'}
               X=80;
         otherwise
             X=[];
      end
   case 'E'
      X=max(60,h.Pt+30);%60 for harmonics
   otherwise
      X=[];
end