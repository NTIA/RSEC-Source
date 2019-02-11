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
           X=60;
        otherwise
           X=[];
      end
   case 'B'
      switch h.ModType
         case {3,4,6,7,9,10}
            X=max(60,h.Pt+30);
         case {2,5,8}
            X=60;
         otherwise
            X=[];
      end
   case 'C'
      switch h.ModType
         case {3,4,6,7,9,10}
            X=max(60,h.Pt+30);
         case {2,5,8}
            X=60;
         otherwise
            X=[];
      end
   case 'D'
      switch h.ModType
         case {3,4,6,7,9,10}
            X=80;
         case {2,5,8}
            X=80;
         otherwise
            X=[];
      end
   case 'E'
      X=max(60,h.Pt+30);%60 for harmonics
   otherwise
      X=[];
end