function Y = MaskBuilder(B40,XdB,Fn,Slope)
global AppData MRData Flags

LocalIcon = [pwd '\Radar.png'];

BWTest = B40;
SpanTest = Fn(end) - Fn(1);

if SpanTest < BWTest
ed = errordlg('The Span Settings are too narrow!','Please set FRQ Start-Stop & Try Again');
SetFigIcon(ed,LocalIcon);
waitfor(ed);
Y = Fn; 
return
end

%******* Passed the test now we build the Slopeask *******
Y=zeros(size(Fn));

Bs = AppData.Bs;

fBWneg = -0.5*B40;
fBWpos = 0.5*B40;

%FroSlope RSEC Mask DocuSlopeentation
Alpha = (XdB-40)/Slope;
XBW = B40 - Bs;
BXdB = (10^Alpha * XBW) + Bs;
% ****************************
MRData.bwXdB = BXdB;
MRData.bw40 = B40;
IndexBWXdB = find(Fn<=(-BXdB/2),1,'last');

if IndexBWXdB > length(Fn)
IndexBWXdB = length(Fn);
end

if Flags.TextData
Span = (Fn(end) - Fn(1)); 
Fn = linspace(-(Span/2),(Span/2),length(Y));
else
    if ischar(AppData.SpanSet)
    Span = str2double(AppData.SpanSet);
    else
    Span = AppData.SpanSet;
    end
end

GapFill = ceil(B40/(Span/length(Fn))); %MHz per point
    
DNoSlope = GetScaledBW(fBWneg,XdB,Fn,IndexBWXdB);    
    
fBWneg = fBWneg/DNoSlope; 
fBWpos = fBWpos/DNoSlope;
    
for k=1:find(Fn<=fBWneg, 1, 'last' )
   Y(k)=-((Slope*1.5)*log10(Fn(k)/fBWneg)+40);
   if Y(k)<-XdB 
      Y(k)=-XdB;
   end
end

for k=find(Fn>=fBWpos, 1 ):length(Y)
   Y(k)=-((Slope*1.5)*log10(Fn(k)/fBWpos)+40);
   if Y(k)<-XdB
      Y(k)=-XdB;
   end
end   

[~,n] = size(Y);
if n == 1
Y = Y';
end

Indx = find(Y==0, 1, 'first' );
Y1 = Y(1:Indx);
Indx = find(Y==0, 1, 'last' );
Y2 = Y(Indx:end);
Q = zeros((GapFill-2),1)';

A = [Y1 Q Y2];
if length(A) > length(Y)
TriSlope = ceil((length(A)-length(Y))/2);
A = A((TriSlope+1):(end-TriSlope));
end
Y = A;

if length(Fn) > length(Y)
Y(end+1) = -XdB;   
end

AppData.Fn = Fn;

return