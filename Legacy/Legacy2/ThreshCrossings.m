function [over,under]=ThreshCrossings(S,P)

[n,~] = size(P);
if n == 1 
P = P';
end

[n,~] = size(S);
if n == 1 
S = S';
end

th1=find(S>P);
over=[];
under=ones((length(th1)-1),1);

if ~isempty(th1)
   iover=1;
   over(iover)=th1(1);
   iunder=0;
   for i=2:length(th1)
      if th1(i)~=th1(i-1)+1
         iunder=iunder+1;
         under(iunder)=th1(i-1)+1;
         iover=iover+1;
         over(iover)=th1(i);
      end
   end
   if th1(end) < length(S)
      iunder=iunder+1;
      under(iunder)=th1(end)+1;
   end
end

return