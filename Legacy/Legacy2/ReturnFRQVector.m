function F = ReturnFRQVector(FAX,FC)
X = length(FAX);
St = -(FC-FAX(1));
Fin = FAX(end)-FC;

F = linspace(St,Fin,X);

return