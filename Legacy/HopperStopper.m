function Y = HopperStopper(B40,BXdB,XdB,Fn,s)

Y=zeros(size(Fn));

BW40neg = -B40/2;
BW40pos = B40/2;

BWXdBneg = -BXdB/2;
BWXdBpos = BXdB/2;

BXdBPt = find(Fn<=BWXdBneg, 1, 'last' );
B40Pt = find(Fn<=BW40neg, 1, 'last' );

DeltaCt = B40Pt - BXdBPt;
DeltaF = BWXdBneg - BW40neg;

IntCreF = DeltaF/DeltaCt;
IntCredB = (-XdB - (-40))/DeltaCt;

for k=1:BXdBPt
   Y(k)=-XdB;
end

Cnt = 0;

for k= BXdBPt:B40Pt-1
   Y(k) = -(s*log10(Fn(k)/(BWXdBneg-(IntCreF*Cnt)))+ (XdB+(IntCredB*Cnt)));
   Cnt = Cnt + 1;
      
   if Y(k)<-XdB
      Y(k)=-XdB;
   end
   
end


BXdBPt = find(Fn>=BWXdBpos, 1 );
B40Pt =  find(Fn>=BW40pos, 1 );

Cnt = 0;

for k= B40Pt:BXdBPt-1
   Y(k) = -(s*log10(Fn(k)/(BW40pos -(IntCreF*Cnt)))+ (40 -(IntCredB*Cnt)));
   Cnt = Cnt + 1;
   
   if Y(k)<-XdB
      Y(k)=-XdB;
   end
   
end

for k=BXdBPt:length(Y)
   Y(k)=-XdB;
end


return

%******************************************************