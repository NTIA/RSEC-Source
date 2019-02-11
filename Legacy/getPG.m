function Y=getPG(h)
switch h.ModType
   case 3 
      Y=0;
   case 4
      Y=0; 
   case 6
      Y=10*log10(h.d);
   case 7
      Y=10*log10(h.d);   
   case 9
      Y=10*log10(h.N);
   otherwise
      Y=0;
end