function B=oldRSECbw(h)

if isfield(h,'PHCW')
h.PHCW = str2double(h.PHCW);
end

if ischar(h.FC)
h.FC = str2double(h.FC);
end

if ischar(h.PRT)
h.PRT = str2double(h.PRT);
end

if ischar(h.PFT)
h.PFT = str2double(h.PFT);
end

if ischar(h.PW)
h.PW = str2double(h.PW);
end

if ischar(h.CBW)
h.CBW = str2double(h.CBW);
end

if isempty(h.Bs)
h.Bs = 0;
else
 if ischar(h.Bs)
 h.Bs = str2double(h.Bs);
 end
end

if isempty(h.Criteria)
   B=[];
   return
end

tr = min(h.PRT,h.PFT);
switch h.Criteria
   case 'A'
      switch h.ModType
         case {3,4}
            if h.Bs>0
            B=(7.6/sqrt(h.PW*1e-6*tr*1e-6)/1e6) + h.Bs;
            else
            B= min((7.6/sqrt(h.PW*1e-6*tr*1e-6)/1e6),(64/(h.PW*1e-6)/1e6));
            end
         case 9
            if h.Bs>0
            B=(7.6/sqrt(tr*1e-6*h.PHCW*1e-6)/1e6) + h.Bs;
            else
            B= min(7.6/sqrt(tr*1e-6*h.PHCW*1e-6)/1e6,(64/(h.PW*1e-6))/1e6);
            end
         case {6,7}
            B=((7.6/sqrt(h.PW*1e-6*tr*1e-6)+ 2 * (h.CBW*1e6+(0.065/(tr*1e-6))))/1e6) + h.Bs;
            if isempty(B)
            B=((7.6/sqrt(h.PW*1e-6*tr*1e-6)+ 2 * (h.CBW*1e6+(0.065/(tr*1e-6))))/1e6);
            end
            
         case {2,8}
            B=(0.0003*h.FC*1e6)/1e6;
         case 5
            B=((0.0003*h.FC*1e6)+ (h.CBW*1e6))/1e6;
         otherwise
            B=[];
      end
  
    case 'B'
      switch h.ModType
         case {3,4}
            if h.Bs>0
            B=(7.6/sqrt(tr*1e-6*h.PW*1e-6))/1e6 + h.Bs;
            else
            B=min((7.6/sqrt(tr*1e-6*h.PW*1e-6))/1e6,(64/(h.PW*1e-6))/1e6);
            end
         case 9
            if h.Bs>0
            B=(7.6/sqrt(tr*1e-6*h.PHCW*1e-6))/1e6 + h.Bs;
            else
            B=min((7.6/sqrt(tr*1e-6*h.PHCW*1e-6))/1e6,(64/(h.PW*1e-6))/1e6);
            end
         case {6,7}
            B= ((7.6/sqrt(h.PW*1e-6*tr*1e-6) + 2 * (h.CBW*1e6+(0.065/(tr*1e-6))))/1e6) + h.Bs;
            if isempty(B)
            B= ((7.6/sqrt(h.PW*1e-6*tr*1e-6) + 2 * (h.CBW*1e6+(0.065/(tr*1e-6))))/1e6);
            end
         case {2,8}
            B=(0.0003*h.FC*1e6)/1e6;
         case 5
            B=((0.0003*h.FC*1e6)+ (h.CBW*1e6))/1e6;
         otherwise
            B=[];
      end
      
   case 'C'
      switch h.ModType
         case {3,4}
            if h.Bs>0
               B=(6.2/sqrt(tr*1e-6*h.PW*1e-6))/1e6 + h.Bs;
            else
               B=min((6.2/sqrt(tr*1e-6*h.PW*1e-6))/1e6,(64/(h.PW*1e-6))/1e6);
            end
         case 9
            if h.Bs>0
               B=(6.2/sqrt(tr*1e-6*h.ts))/1e6 + h.Bs;
            else
               B=min((6.2/sqrt(tr*1e-6*h.ts))/1e6,(64/(h.PW*1e-6)))/1e6;
            end
         case {6,7}
            B = ((6.2/sqrt(h.PW*1e-6*tr*1e-6) + 2*(h.CBW*1e6+(0.105/(tr*1e-6))))/1e6) + h.Bs;
         case {2,8}
            B=(0.0003*h.FC*1e6)/1e6;
         case 5
            B=((0.0003*h.FC*1e6)+ (h.CBW*1e6))/1e6;
         otherwise
            B=[];
      end
      
   case 'D'
      switch h.ModType
         case {3,4}
            B=(6.2/sqrt(tr*1e-6*h.PW*1e-6))/1e6 + h.Bs;
          case {9,10}
            B=(6.2/sqrt(tr*1e-6*h.ts))/1e6 + h.Bs;
         case {6,7}
            B = ((6.2/sqrt(h.PW*1e-6*tr*1e-6) + 2*(h.CBW*1e6+(0.105/(tr*1e-6))))/1e6) + h.Bs;
         case {2,8}
            B=(0.0003*h.FC*1e6)/1e6;
         case 5
            B=((0.0003*h.FC*1e6)+ h.CBW*1e6)/1e6;
         otherwise
            B=[];
      end
   case 'E'
      switch h.ModType
         case 3
            B=min((6.2/sqrt(tr*1e-6*h.PW*1e-6))/1e6,(64/(h.PW*1e-6))/1e6);
         case 9
            B=min((6.2/sqrt(tr*1e-6*h.PWs))/1e6,(64/(h.PW*1e-6))/1e6);
         case {6,7}
            B = ((6.2/sqrt(h.PW*1e-6*tr*1e-6) + 2*(h.CBW*1e6+(0.105/(tr*1e-6))))/1e6);
         case {2,8}
            B=(0.0003*h.FC*1e6)/1e6;
         case 5
            B=((0.0003*h.FC*1e6)+ (h.CBW*1e6))/1e6;
         otherwise
            B=[];
      end
   case 'F'
      B=[];
end