function pbPG_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.PG = getPG(AppData);
CObject.PgB1.String = num2str(AppData.PG);
CObject.Pg.Value = 0;

refresh;

return

function Y=getPG(h)
switch h.ModT
   case {'Pulse No Mod','Pulse No Mod/FHop'}
      Y=0;
   case {'Pulse/FM','Pulse/FM FHop'}
      Y=10*log10(h.d);
   case {'Pulse/PC','Pulse/PC FHop'}
      Y=10*log10(h.N);
   otherwise
      Y=[];
end