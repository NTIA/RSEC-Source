function B=newRSECbw(h)
global Flags

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
         case {2,8}
              if Flags.RSEC_A1 
              B=0.0003*h.FC;  
              else
              B=0.0003*h.FC;   
              end
         case {3,4}
            if h.Bs>0
               B=7.6/sqrt(tr*h.PW)+h.Bs;
            else
               B=min(7.6/sqrt(tr*h.PW),64/h.PW);
            end
         case 9
            if h.Bs>0
               B=7.6/sqrt(tr*h.PHCW)+h.Bs;
            else
               B=min(7.6/sqrt(tr*h.PHCW),64/h.PW);
            end
         case {6,7}
               B=B40LFM(h.CBW,h.PW,h.PRT,h.PFT,1.5);
         case 5
               B=0.0003*h.FC+h.CBW;
         otherwise
               B=[];   
      end
      
   case 'B'
      switch h.ModType
         case {3,4}
            if h.Bs>0
               B=7.6/sqrt(tr*h.PW)+h.Bs;
            else
               B=min(7.6/sqrt(tr*h.PW),64/h.PW);
            end
         case 9
            if h.Bs>0
               B=7.6/sqrt(tr*h.PHCW)+h.Bs;
            else
               B=min(7.6/sqrt(tr*h.PHCW),64/h.PW);
            end
         case {6,7}
            B=B40LFM(h.CBW,h.PW,h.PRT,h.PFT,1.5);
            if isempty(B)
               B=7.6/sqrt(tr*h.PW)+2*(h.CBW+0.065/tr);
            end
            B=B+h.Bs;
         case {2,8}
            B=0.0003*h.FC;
         case 5
            B=0.0003*h.FC+h.CBW;
         otherwise
            B=[];
      end
   case 'C'
      switch h.ModType
         case {3,4}
            if h.Bs>0
               B=6.2/sqrt(tr*h.PW)+h.Bs;
            else
               B=min(6.2/sqrt(tr*h.PW),64/h.PW);
            end
          case 9
            if h.Bs>0
               B=6.2/sqrt(tr*h.PHCW)+h.Bs;
            else
               B=min(6.2/sqrt(tr*h.PHCW),64/h.PW);
            end
         case {6,7}
            B=B40LFM(h.CBW,h.PW,h.PRT,h.PFT,1.5);
            if isempty(B)
               B=6.2/sqrt(tr*h.PW)+2*(h.CBW+0.105/tr);
            end
            B=B+h.Bs;
         case {2,8}
            B=0.0003*h.FC;
         case 5
            B=0.0003*h.FC+h.CBW;
         otherwise
            B=[];
      end
   case 'D'
      switch h.ModType
         case {3,4}
            B=6.2/sqrt(tr*h.PW)+h.Bs;
         case 9
            B=6.2/sqrt(tr*h.PHCW)+h.Bs;
         case {6,7}
            B=B40LFM(h.CBW,h.PW,h.PRT,h.PFT,1.5);
            if isempty(B)
               B=6.2/sqrt(tr*h.PW)+2*(h.CBW+0.105/tr);
            end
            B=B+h.Bs;
         case {2,8}
            B=0.0003*h.FC;
         case 5
            B=0.0003*h.FC+h.CBW;
         otherwise
            B=[];
      end
   case 'E'
      switch h.ModType
         case {3,4}
            B=min(6.2/sqrt(tr*h.PW),64/h.PW);
         case 9
            B=min(6.2/sqrt(tr*h.PHCW),64/h.PW);
         case {6,7}
            B=B40LFM(h.CBW,h.PW,h.PWr,h.PWf,1.5);
            if isempty(B)
               B=6.2/sqrt(tr*h.PW)+2*(h.CBW+0.105/tr);
            end
         case {2,8}
            B=0.0003*h.FC;
         case 5
            B=0.0003*h.FC+h.CBW;

         otherwise
            B=[];
      end
end