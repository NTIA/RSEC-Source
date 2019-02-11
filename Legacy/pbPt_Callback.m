function pbPt_Callback(hObject, eventdata, handles)
global AppData CObject


AppData.Pt=getPt(AppData);
CObject.PtB1.String = num2str(AppData.Pt);
CObject.Pt.Value = 0;

refresh;
return


function Y=getPt(h)
if ischar(h.PP) && ischar(h.PRR)
Y = str2num(h.PP)+20*log10(h.N*h.PW)+10*log10(str2num(h.PRR))-h.PG-90;
end
if ischar(h.PP) && ~ischar(h.PRR)
Y = str2num(h.PP)+20*log10(h.N*h.PW)+10*log10(h.PRR)-h.PG-90;
end
if ~ischar(h.PP) && ~ischar(h.PRR)
Y = h.PP + 20*log10(h.N*h.PW)+10*log10(h.PRR)-h.PG-90;
end
return