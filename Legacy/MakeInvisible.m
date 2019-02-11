function MakeInvisible()
global CObject

if  isfield(CObject, 'PWTitle') && ishandle(CObject.PWTitle)
    
    CObject.PWTitle.Visible = 'off';        
    CObject.PW.Visible = 'off';
    CObject.PWLabel.Visible = 'off';
    CObject.PRT.Visible = 'off';
    CObject.PRTLabel.Visible = 'off';
    CObject.PFT.Visible = 'off';
    CObject.PFTLabel.Visible = 'off';
    CObject.PRR.Visible = 'off';
    CObject.PRRLabel.Visible = 'off';
    CObject.PWLabel.Visible = 'off';
    CObject.PRTLabel.Visible = 'off';

end

if  isfield(CObject, 'FHOPTitle') && ishandle(CObject.FHOPTitle)
    
    CObject.FHOPTitle.Visible = 'off';
    CObject.FHOPL.Visible = 'off';
    CObject.FHOPLLabel.Visible = 'off';
    CObject.FHOPH.Visible = 'off';
    CObject.FHOPHLabel.Visible = 'off';  
    
end

if  isfield(CObject, 'FMChirpTitle') && ishandle(CObject.FMChirpTitle)

    CObject.FMChirpTitle.Visible = 'off';
    CObject.CBW.Visible = 'off';     
    CObject.CBWLabel.Visible = 'off';     
    CObject.RadioLin.Visible = 'off';
    CObject.RadioNonLin.Visible = 'off';

end

if  isfield(CObject, 'PHCTitle') && ishandle(CObject.PHCTitle)
  
    CObject.PHCTitle.Visible = 'off';
    CObject.PHCW.Visible = 'off';   
    CObject.PHCWLabel.Visible = 'off';   
    CObject.PHCNum.Visible = 'off'; 
    CObject.PHCNumLabel.Visible = 'off';
    
end
        

return