function Y = Criteria2SelCriteria(Criteria)
if isempty(Criteria)
   Y=1;
   return;
end
switch Criteria
   case 'A'
      Y=1;
   case 'B'
      Y=2;
   case 'C'
      Y=3;
   case 'D'
      Y=4;
   case 'E'
      Y=5;
   case 'F'
      Y=6;
end