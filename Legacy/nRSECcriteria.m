function [x,y]=nRSECcriteria(h)
global Flags CObject

IconLocation = [pwd '\Radar.png'];

y = []; x = []; %#ok<*NASGU>

if ~isfield(h,'UseageN')
h.UseageN = CObject.PopUp4.String{CObject.PopUp4.Value};
end


if isempty(h.PP)
h.PP = 0;
end

if isfield(h,'PW') && ischar(h.PW)
PW = str2double(h.PW);
elseif ~isfield(h,'PW')
PW = 0;  
else
PW = h.PW;    
end

if isfield(h,'PRR') && ischar(h.PRR)
PRR = str2double(h.PRR);
elseif ~isfield(h,'PRR')
PRR = 0; 
else
PRR = h.PRR;
end

if isempty(PW)
PW = 0;
end

if isempty(PRR)
PRR = 0;
end

DC = (PW/PRR) * 100;

if DC < 10 && DC ~= 0
Flags.DC = 1;
else
Flags.DC = 0;
end

if ischar(h.PP)
tmp = str2double(h.PP);
else
tmp = h.PP;
end

p=dBm2watts(tmp);

if h.ModType == 2 || h.ModType == 5 || h.ModType == 8 
    
NonPulse=1;
else
NonPulse=0;
end

if h.ModType == 3 || h.ModType == 4 || h.ModType == 6 || h.ModType == 7 ||...
   h.ModType == 9 || h.ModType == 10

Pulsed = 1;
else
Pulsed = 0;
end

%Criteria A Non-pulsed radars of 40 watts or less rated average power
%Pulsed radars of 1 kW or less rated peak power
%Radars with an operating frequency above 40 GHz
%Man-portable10 radars- Man-transportable11 radars - Expendable
%non-recoverable radars on missiles
if Flags.RC == 0
    if strcmp(h.UseageN(1:3),'Man') && (p > 40 * 1e3)
    ed = errordlg('The Radar cannot be Man transportable with that much power!','Useage Error 101');
    SetFigIcon(ed,IconLocation);
    waitfor(ed);
    h.UseageN = 'Fixed';
    end
    Flags.RC = 1;
end


if NonPulse && p <= 40 || Pulsed && p <= 1000 || h.FC > 40000 ||strcmp(h.UseageN(1:3),'Man')||strcmp(h.UseageN(1:3),'Exp')

    if h.FC >= 2700 && h.FC <= 2900
    x = 'D';
    return
    else
    x = 'A';
    end

    if p > 100 || Flags.DC
    y = 55;
    elseif p <= 100 && p > 1
    y = 50;
    elseif p <= 1
    y = 40;
    end

    if p > 1
    Flags.RSEC_A1 = 1;
    else
    Flags.RSEC_A1 = 0;
    end

elseif (p>1000&&p<=100000)&&(h.FC>2900&&h.FC<40000)
x='B';
elseif strcmp(h.UseageN,'Fixed') && (h.FC>=2700&&h.FC<=2900)
x='D';
elseif strcmp(h.UseageN,'WPR')&& h.FC==449
x='E';
else
x='C';
end

return


function X=dBm2watts(Y)
X=10^(Y/10)/1000;
return