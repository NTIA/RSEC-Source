function h=PlotRSEC(h,MaskFlag)
global CObject TraceLocker Flags

h.oo = [];h.uu=[];

set(CObject.MyFigMain, 'pointer', 'watch');
drawnow;

axes(CObject.PlotAX1);

if isfield(h,'PW') && ischar(h.PW)
h.PW = str2double(h.PW);
elseif ~isfield(h,'PW')
h.PW = [];    
end

if isfield(h,'PRT') && ischar(h.PRT)
h.PRT = str2double(h.PRT);
elseif ~isfield(h,'PRT')
h.PRT = [];    
end

if isfield(h,'PFT') && ischar(h.PFT)
h.PFT = str2double(h.PFT);
elseif ~isfield(h,'PFT')
h.PFT = [];    
end

if isfield(h,'CBW')&& ischar(h.CBW)
h.CBW = str2double(h.CBW);
elseif ~isfield(h,'CBW')
h.CBW = [];    
end

if isempty(h.FC)
h.FC=getFC(h.Fm,h.Sm);
else
if ischar(h.FC)    
h.FC = str2double(h.FC);
end
end

Fn = h.Fm - h.FC;
h.FCM = h.FC;

if h.ModType == 3 || h.ModType == 4 || h.ModType == 6 || h.ModType == 7 ||...
   h.ModType == 9 || h.ModType == 10

   dr = h.PRT*1.25;
   df = h.PFT*1.25;
   tb = h.PW + dr/2 + df/2;
   
else
    
   h.PW = [];
   h.PRT = [];
   h.PRF = [];
   h.PRR = [];
   
end

if h.ModType == 6
   h.d = h.CBW * tb;
else
   h.d=[];
end

UseNum = CObject.PopUp4.Value;

if UseNum == 1 || UseNum == 7
h.UsageN = 'Other';  
end
if UseNum == 2
h.UsageN = 'Radio Navigation';  
end
if UseNum == 3
h.UsageN = 'WPR';  
end
if UseNum == 4
h.UsageN = 'Fixed';  
end
if UseNum == 5
h.UsageN = 'Expendable or Missile';  
end
if UseNum == 6
h.UsageN = 'Man-Portable/Transporatable';  
end
if ~isfield(h,'UsageN')
h.UsageN = 'Other';
end

if isfield(h,'PP') && ischar(h.PP)
h.PP = str2double(h.PP);
elseif ~isfield(h,'PP')
h.PP = [];
end

[h.RSECcrit,h.XdB] = nRSECcriteria(h);

if isempty(h.Criteria)
   h.Criteria=h.RSECcrit;
end

if isempty(h.Bs)
   h.Bs=0;
end

h.bwRSECn=newRSECbw(h);
h.bwRSECo=oldRSECbw(h);

if ~isfield(h,'PG')
h.PG = 0;
end

if isempty(h.PG)
   h.PG=getPG(h);
end

if ~isfield(h,'N')
h.N = [];
end

if isempty(h.N)
   if h.ModType == 3 || h.ModType == 6 || h.ModType == 4 || h.ModType == 7 || h.ModType == 10
   h.N = 1;
   else
   h.N = [];
   end
end

if ~isfield(h,'Pt')
h.Pt = 0;
end

if isempty(h.Pt) && ~isempty(h.PP) && ~isempty(h.PRR)
    
   if ischar(h.PRR)
   h.PRR = str2double(h.PRR);
   end

if isempty(h.PG)
h.PG = 0;
end

h.Pt = h.PP + 20*log10(h.N*h.PW) + 10*log10(h.PRR)- h.PG - 90;
end

    if ~isfield(h,'XdB')
    h.XdB = [];
    end
    if isempty(h.XdB)
    h.XdB=getXdB(h);
    end


if isfield(h,'nSlope')
     if isempty(h.nSlope) 
     if max(strcmp(h.Criteria,{'','D','E'}))==1
     h.nSlope=40;
     else
     h.nSlope=30;
     end
     if strcmp(h.Criteria,'A')
     h.nSlope = 20; 
     end
     end
     

else
            if max(strcmp(h.Criteria,{'','D','E'}))==1
            h.nSlope=40;
            else
            h.nSlope=30;
            end  
            if strcmp(h.Criteria,'A')
            h.nSlope = 20;    
            end
end

if max(strcmp(h.Criteria,{'','D','E'}))==1
   h.oSlope=40;
else
   h.oSlope=20;
end

if strcmp(h.Criteria,{'F'}) || isempty(h.Criteria)
   h.nRollOff=zeros(length(h.Fm),1);
   h.oRollOff=zeros(length(h.Fm),1);
   h.oo=[];h.uu=[];
else
    h.oRollOff=getMask(h.bwRSECo,h.XdB,h.oSlope,h.Fm-h.FCM);
    h.nRollOff=getMask(h.bwRSECn,h.XdB,h.nSlope,h.Fm-h.FCM);
    
    if Flags.OverUnder == 0
       [h.oo, h.uu]=ThreshCrossings(h.Sm,h.oRollOff);
       Flags.OverUnder = 1;
    end
end

if MaskFlag == 0
CObject.TogNormIF.Value = 0;
CObject.TogNormIF.BackgroundColor = [.87 .92 .98];  
CObject.TogResBW.Value = 0;
CObject.TogResBW.BackgroundColor = [.87 .92 .98];  
CObject.TogTitle.Value = 0;
CObject.TogTitle.BackgroundColor = [.87 .92 .98];  
CObject.Overage.Value = 0;
CObject.Overage.BackgroundColor = [.87 .92 .98];  
CObject.Legacy.Value = 0;
CObject.Legacy.BackgroundColor = [.87 .92 .98];  
CObject.Mask.Value = 0;
CObject.Mask.BackgroundColor = [.87 .92 .98];  
CObject.Theory.Value = 0;
CObject.Theory.BackgroundColor = [.87 .92 .98];  
CObject.Measured.Value = 0;
CObject.Measured.BackgroundColor = [.87 .92 .98];  
CObject.Legend.Value = 0;
CObject.Legend.BackgroundColor = [.87 .92 .98];  
CObject.CustomMask.Value = 0;
CObject.CustomMask.BackgroundColor = [.87 .92 .98];  
end

if get(CObject.TogNormIF,'value')%Flags can be changed above
Fp=Fn;
else
Fp=h.Fm;
end

if h.ModType==4 || h.ModType==7 ||h.ModType==10
    if Flags.TextData
    Span = (Fn(end) - Fn(1)); 
    else
    Span = h.SpanSet;
    end 
Fp = linspace(h.FC-(Span/2),(h.FC+Span/2),length(Fn));    
end

if isempty(h.Fm)
Fs = str2double(h.FRQHi) - str2double(h.FRQLow);
else
Fs = h.Fm(end) - h.Fm(1);
end

if ischar(h.PRR)
h.PRR = str2double(h.PRR);
end

switch h.ModType
   case {6,7}
      if isempty(h.PRR)
         warndlg('No PRR, therefore no theoretical spectrum');
         uiwait;
         h.Ft=h.FC;h.St=0;
      else
         dc=h.PW*h.PRR*1e-6;
         dc=checkdc(dc,Fs,h.PW,dr,df);%adjusts dc if necessary to avoid out of memory
         [h.Ft,h.St]=Gen_Trap_Spect(0,h.CBW,h.PW,dr,df,dc,Fs);
         h.St=h.St-max(h.St);
         h.Ft=h.Ft+h.FC;
      end
   case {3,4}
      if isempty(h.PRR)
         warndlg('No PRR, therefore no theoretical spectrum');
         uiwait;
         h.Ft=h.FC;h.St=0;
      else
         dc=h.PW*h.PRR*1e-6;
         dc=checkdc(dc,Fs,h.PW,dr,df);
         [h.Ft,h.St]=Gen_Trap_Spect(0,0,h.PW,dr,df,dc,Fs);
         h.St=h.St-max(h.St);
         h.Ft=h.Ft+h.FC;
      end
   otherwise
      h.Ft=h.FC;h.St=0;
end

if isfield(h, 'CMslope')
    if isempty(h.CMslope)
        h.CMslope=30;
    end    
else
    h.CMslope=30;        
end

if isfield(h, 'CMxdb')
    if isempty(h.CMxdb)
        h.CMxdb=60;
    end    
else
    h.CMxdb=60;        
end

if isfield(h, 'CMbw')
    if isempty(h.CMbw)
        h.CMbw=10;
    end    
else
    h.CMbw=10;        
end

h.custMask=getMask(h.CMbw, h.CMxdb, h.CMslope, h.Fm-h.FCM);

if get(CObject.CustomMask, 'value')%This is here to clean up line 7 during refresh
   set(TraceLocker.CustomMask,'visible','off');
end

h.bw40dB = BWs(Fp,h.oRollOff,40,1); 
h.bw20dB = BWs(Fp,h.oRollOff,20,1);

if ~isempty(h.oo) && ~isempty(h.uu)
   h = RSECPlot(h,Fp,3);
elseif ~isempty(h.oo) && isempty(h.uu)
   h = RSECPlot(h,Fp,2); 
elseif isempty(h.oo) && isempty(h.uu)
   h = RSECPlot(h,Fp,1);
end


if get(CObject.CustomMask, 'value')
    set(TraceLocker.CustomMask,'visible','on');
else
    set(TraceLocker.CustomMask,'visible','off');
end

if min(h.Sm) == max(h.Sm)%if no real measured data, turn off curve
TraceLocker.UserData.Visible = 'off';
end

if MaskFlag == 0 %If Measured Data Toggle is not set
TraceLocker.UserData.Visible = 'Off';     
set(TraceLocker.RedRings,'visible','off'); 
set(TraceLocker.GreenRings,'visible','off'); 
end

grid on

h.htitle = PlotTitleII(h,1);

CObject.CPU.Value = Criteria2SelCriteria(h.Criteria);
CObject.BWCnEB1.String = num2str(h.bwRSECo);
CObject.SlopeB1.String = num2str(h.oSlope);
CObject.XdB1.String = num2str(h.XdB);
CObject.PtB1.String = num2str(h.Pt);
CObject.PgB1.String = num2str(h.PG);

if get(CObject.CustomMask, 'value')
   h.hlegend=legend([TraceLocker.UserData, TraceLocker.RSEC_Mask, TraceLocker.ProposedRSEC,TraceLocker.CustomMask],h.RadarFName,...
   ['RSEC Mask ' h.Criteria ' ' num2str(h.oSlope) 'dB/dec'],...
   ['FY2020 RSEC ' h.Criteria ' ' num2str(h.nSlope) 'dB/dec'],...
   ['Custom Mask ' num2str(h.CMxdb) 'dB/dec'],'Location','northeast');
else
h.hlegend=legend([TraceLocker.UserData, TraceLocker.RSEC_Mask, TraceLocker.ProposedRSEC],h.RadarFName,...
   ['RSEC Mask ' h.Criteria ' ' num2str(h.oSlope) 'dB/dec'],...
   ['FY2020 RSEC ' h.Criteria ' ' num2str(h.nSlope) 'dB/dec'],'Location','northeast');
end

set(CObject.PlotAX1, 'FontSize', 8);
xticks=get(CObject.PlotAX1,'xtick');
yticks=get(CObject.PlotAX1,'ytick'); % Err if no axes1

h.X=get(gca,'Xlim');
h.Y=get(gca,'Ylim');%keep track of original axes extent

if ~isfield(h,'Detect')
h.Detect = [];    
end

if h.Detect == 2
h.DETtype = 'Peak';
else
     if h.Detect == 3
     h.DETtype = 'RMS';
     else
     h.DETtype = [];    
     end
end

if ~isfield(h,'ResBW')
h.ResBW = [];    
end

if CObject.TogResBW.Value == 0
TraceLocker.RESBW = text(CObject.PlotAX1,h.X(1),-5,...
   [' BWres: ' num2str(h.ResBW) '\newline DETtype: ' h.DETtype],'FontSize',8,...
   'units','inches','BackgroundColor','w','edgecolor','k');

set(TraceLocker.RESBW,'units','inches','position',[0.05 3.180]);
set(TraceLocker.RESBW,'Visible','on');

ax=1;ay=1;
else
set(TraceLocker.RESBW,'Visible','off');    
ax=0;ay=0;    
end

if ~isfield(h,'xmin')
h.xmin = [];    
end
if ~isfield(h,'xmax')
h.xmax = [];    
end
if ~isfield(h,'xstep')
h.xstep = [];    
end
if ~isfield(h,'ymin')
h.ymin = [];    
end
if ~isfield(h,'ymax')
h.ymax = [];    
end
if ~isfield(h,'ystep')
h.ystep = [];    
end

if isempty(h.xmin), h.xmin=xticks(1);ax=0;end
if isempty(h.xmax), h.xmax=xticks(end);ax=0;end
if isempty(h.xstep), h.xstep=xticks(2)-xticks(1);ax=0;end
if isempty(h.ymin), h.ymin=yticks(1);ay=0;end
if isempty(h.ymax), h.ymax=yticks(end);ay=0;end
if isempty(h.ystep), h.ystep=yticks(2)-yticks(1);ay=0;end

if CObject.Measured.Value == 0
if ax
   xlim([h.xmin h.xmax]);
   set(CObject.PlotAX1,'xtick',h.xmin:h.xstep:h.xmax);
end

if ay
   ylim([h.ymin h.ymax]);
   set(CObject.PlotAX1,'ytick',h.ymin:h.ystep:h.ymax);
end
end

set(CObject.MyFigMain, 'pointer', 'arrow')
drawnow;
return

function y=checkdc(dc,Fs,tau,dr,df)
tb=tau + .5*(dr+df);
dt=1/Fs;    
t = -tb/2:dt:tb/2-dt;
M=length(t);
N=ceil(M/dc);
th=5e6;
if N>th
   y=M/th;
else
   y=dc;
end

function [f,SdB] = Gen_Trap_Spect(fc,Bc,tau,dr,df,dc,Fs)
% FFT of trapezoidal pulse
% Calculate the spectrum of a complex trapezoidal chirp.  Plot the power spectrum
% Bc is zero for un-modulated pulse
tb=tau + .5*(dr+df);  %pulse width at the base.  Chirp occurs over this width
dt=1/Fs;    

t = -tb/2:dt:tb/2-dt;   %time for pulse
M=length(t);

A=ones(1,M);    %Create pulse envelope

cc=floor(dr/dt+1);
A(1:cc)=t(1:cc)/dr+0.5*tb/dr;
dd=ceil((tb-df)*Fs)+1;%ceil(df/dt-1);
A(dd:end)=-t(dd:end)/df+0.5*tb/df;

N=ceil(M/dc);%2^16; %# FFT points

x = A.*exp(1i*(2*pi*(fc*t+Bc*(t.^2)/(2*tb))));
   
SdB = 20*log10(abs(fftshift(fft(x,N)))); %This is a FFT shifted
dFf=Fs/N;    
f = -Fs/2:dFf:+Fs/2-dFf;%-.5*N/dFf:.5*N/dFf-1;     % frequency scale, Hz

return

function Y=getMask(B40,XdB,m,Fn)
global AppData CObject Flags MRData

Y=zeros(size(Fn));

% Fn is frequency vector, Fo is center frequency, B40 is RSEC 40 dB bandwidth
% and the hopping bandwidth, -XdB is the maximum RSEC attenuation
% m is the rolloff slope in dB/decade (always positive)
% MT = Modulation Type Use a hard slope for FHOP

if AppData.ModType==4 || AppData.ModType==7 ||AppData.ModType==10
    
Y = MaskBuilder(B40,XdB,Fn,m);    
  
else
    
Alpha = (XdB-40)/m;
BWXdB = (10^Alpha) * B40;
IndXdB = find(Fn<=(-BWXdB/2),1,'last');
fBWneg = -B40/2;
fBWpos = B40/2;    

%This is for a look only..maybe have to incorporate later
DNoSlope = GetScaledBW(fBWneg,XdB,Fn,IndXdB);

if Flags.LegacyHold == 0
    if isempty(IndXdB)
    tmp = num2str (BWXdB/2);    
    CObject.BWFactor.String = ['BW=' tmp];
    else
    CObject.BWFactor.String = num2str(DNoSlope);
    end
Flags.LegacyHold = 1; 
MRData.bw40 = B40;
MRData.bwXdB = BWXdB;
end
%********************************************************

IndexPoint = find(Fn<=fBWneg, 1, 'last' );

for k=1:IndexPoint
   Y(k)=-(m*log10(Fn(k)/fBWneg)+40);
   if Y(k)<-XdB
      Y(k)=-XdB;
   end
end

IndexPoint = find(Fn>=fBWpos, 1 );

for k=IndexPoint:length(Y)
   Y(k)=-(m*log10(Fn(k)/fBWpos)+40);
   if Y(k)<-XdB
      Y(k)=-XdB;
   end
end

end

return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%