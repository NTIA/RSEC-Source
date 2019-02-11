function MaskTog(hObject, eventdata, handles)
global AppData CObject TraceLocker

if get(hObject,'Value')==1
   set(CObject.Mask,'BackGroundColor',[0.3 0.75 0.93]);  
   AppData.FCM = minimizerror(AppData,'max');%'max': shift FCM high
   drawnow
else
   set(CObject.Mask,'BackGroundColor',[.87 .92 .98]);  
   AppData.FCM = AppData.FC;
   drawnow
end

updateMask();
set(TraceLocker.RSEC_Mask,'Visible','on');

return

function updateMask()
global AppData CObject TraceLocker

if sum(strcmp(AppData.Criteria,{'','F'}))
   AppData.oRollOff=zeros(length(AppData.Fm),1);
   AppData.oo=[];AppData.uu=[];
else
    AppData.oRollOff = getMask(AppData.bwRSECn,AppData.XdB,AppData.oSlope,AppData.Fm-AppData.FCM);
   [AppData.oo AppData.uu] = ThreshCrossings(AppData.Sm,AppData.oRollOff);
end

if get(CObject.TogNormIF,'value')
   Fp=AppData.Fm-AppData.FC;
else
   Fp=AppData.Fm;
end

set(TraceLocker.RSEC_Mask,'xdata',Fp,'ydata',AppData.oRollOff);

if isempty(AppData.oo)
   set(TraceLocker.RedRings,'xdata',AppData.FC,'ydata',0,'visible','off');
else
   set(TraceLocker.RedRings,'xdata',Fp(AppData.oo),'ydata',AppData.Sm(AppData.oo));
   if get(CObject.Overage,'value')==0
      set(TraceLocker.RedRings,'visible','on');
   end
end
if isempty(AppData.uu)
   set(TraceLocker.GreenRings,'xdata',AppData.FC,'ydata',0,'visible','off');
else
   set(TraceLocker.GreenRings,'xdata',Fp(AppData.uu),'ydata',AppData.Sm(AppData.uu));
   if get(CObject.Overage,'value')==0
      set(TraceLocker.GreenRings,'visible','on');
   end
end
updateTitle();
LegendTog();

function FoM = minimizerror(h,s)
global CObject TraceLocker

fn=h.Fm-h.FC;

fBWneg = -0.5*h.bw20dB;
fBWpos = 0.5*h.bw20dB;

mn = find(fn>fBWneg, 1 );
mx = find(fn<fBWpos, 1, 'last' );

evector = zeros(length(h.Fm),1);

if get(CObject.TogNormIF,'value')
   Fp = h.Fm-h.FC;
else
   Fp = h.Fm;
end

for m = mn:mx
   oRollOff = getMask(h.bwRSECo,h.XdB,h.oSlope,h.Fm-h.Fm(m));
   set(TraceLocker.RSEC_Mask,'xdata',Fp,'ydata',oRollOff);
   e=zeros(length(h.Fm),1);
   drawnow
   for n=1:length(h.Fm)-1 %This loop allows for possibility of varying frequency step sizes
      if h.Sm(n)>oRollOff(n)
         e(n)=(h.Sm(n)-oRollOff(n))*(fn(n+1)-fn(n));
      end
   end
   evector(m)=sum(e);
end

if strcmp(s,'min')
   FoM = h.Fm(mn-1+find(evector(mn:mx)==min(evector(mn:mx)), 1 ));
elseif strcmp(s,'max')
   FoM = h.Fm(mn-1+find(evector(mn:mx)==min(evector(mn:mx)), 1, 'last' ));
end

if isempty(FoM)
FoM = h.FC;
end



function updateTitle()
global AppData CObject

if ~isfield(AppData,'htitle')
   return
end
if get(CObject.TogNormIF,'value')
   set(AppData.htitle,'string',[AppData.ModType,' Bc=',num2str(AppData.Bc),' Bs=',num2str(AppData.Bs),...
   ' t=',num2str(AppData.t),' tr=',num2str(AppData.tr),' d=',num2str(AppData.d),' PRR=',...
   num2str(AppData.PRR),' Pp=',num2str(AppData.PP),' N=',num2str(AppData.N),' Pt=',num2str(AppData.Pt),...
   '\newline','bw40dB=',num2str(AppData.bw40dB),' bwRSECn=',num2str(AppData.bwRSECn),...
   ' bwRSECo=',num2str(AppData.bwRSECo),' PG=',num2str(AppData.PG),' XdB=',num2str(AppData.XdB),...
   ' RSECcrit=',num2str(AppData.RSECcrit)]);
else
   set(AppData.htitle,'string',[AppData.ModType,' FC=',num2str(AppData.FC),' FCM=',num2str(AppData.FCM),...
      ' Bc=',num2str(AppData.Bc),' Bs=',num2str(AppData.Bs),' t=',num2str(AppData.t),' tr=',...
      num2str(AppData.tr),' d=',num2str(AppData.d),' PRR=',num2str(AppData.PRR),' Pp=',...
      num2str(AppData.PP),' N=',num2str(AppData.N),' Pt=',num2str(AppData.Pt),'\newline','bw40dB=',...
      num2str(AppData.bw40dB),' bwRSECn=',num2str(AppData.bwRSECn),' bwRSECo=',...
      num2str(AppData.bwRSECo),' PG=',num2str(AppData.PG),' XdB=',num2str(AppData.XdB),...
      ' RSECcrit=',num2str(AppData.RSECcrit)]);
end