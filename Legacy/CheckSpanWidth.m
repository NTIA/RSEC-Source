function p = CheckSpanWidth(Span)
global CObject AppData

if ischar(Span)
Span = str2double(Span);
end
if ischar(AppData.FC)
NewSpan = str2double(AppData.FC)/2;
else
NewSpan = AppData.FC/2;    
end

p = NewSpan;

if Span < (NewSpan)
StrVal = num2str(ceil(NewSpan));   
StrVal = ['Greater than: ' StrVal ' (MHz)'];
AskForInput({StrVal});                      
waitfor(CObject.InptDLG);                          
p = str2double(AppData.SpanSet);
AppData.xmin = AppData.FC - p/2;
AppData.FL = AppData.xmin;
AppData.xmax = AppData.FC + p/2;
AppData.FH = AppData.xmax;
end

return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%