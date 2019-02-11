function LoadAll()
global AppData CObject


%Load Panel Values and strings
if isfield(AppData,'RadarFName')
CObject.EBox1.String = AppData.RadarFName; 
end

if isfield(AppData,'SPSNumb')
CObject.EBox2.String = AppData.SPSNumb ;
end

if isfield(AppData,'SPSDat')
CObject.EBox3.String = AppData.SPSDat ;
end

if isfield(AppData,'FRQLow')
CObject.EBox4.String = AppData.FRQLow ;
end

if isfield(AppData,'FRQHi')
CObject.EBox5.String = AppData.FRQHi;
end

if isfield(AppData,'FC')
CObject.EBox6.String = AppData.FC;
end

if isfield(AppData,'PP')
CObject.EBox7.String = AppData.PP ;
end

if isfield(AppData,'Gt')
CObject.EBox8.String = AppData.Gt;
end

if isfield(AppData,'ModType')
        if isempty(AppData.ModType)
        AppData.ModType = 1;
        end
CObject.PopUp1.Value = AppData.ModType;
end

if isfield(AppData,'Stage')
        if isempty(AppData.Stage)
        AppData.Stage = 1;
        end
CObject.PopUp2.Value = AppData.Stage ;
end

if isfield(AppData,'Detect')
        if isempty(AppData.Detect)
        AppData.Detect = 1;
        end
CObject.PopUp3.Value = AppData.Detect;
end

if isfield(AppData,'Useage')
        if isempty(AppData.Useage)
        AppData.Useage = 1;
        end
CObject.PopUp4.Value = AppData.Useage;
end


CallModPan();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Check for field then load

if isfield(AppData,'PW')
CObject.PW.String = AppData.PW;
end

if isfield(AppData,'PRT')
CObject.PRT.String = AppData.PRT;
end

if isfield(AppData,'PFT')
CObject.PFT.String = AppData.PFT;
end

if isfield(AppData,'PRR')
CObject.PRR.String = AppData.PRR;
end

if isfield(AppData,'CBW')
CObject.CBW.String = AppData.CBW;
end

if isfield(AppData,'RadioLinear')
CObject.RadioLin.Value = AppData.RadioLinear;
end

if isfield(AppData,'RadioNonLinear')
CObject.RadioNonLin.Value = AppData.RadioNonLinear;
end

end