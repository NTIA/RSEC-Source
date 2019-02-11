function CallModPan()
global CObject Flags AppData

switch CObject.PopUp1.Value
    
    case 1
    AppData.ModT = 'Not Selected';   
    MakeInvisible();
    disp('No Selection');  
    CObject.Pan1.Position = [25 495 250 50]; %[25 429 250 50]
    CObject.PopUp1.Position = [20 5 205 25]; %[20 5 205 25]
    Flags.case = 1;
    drawnow
   
    
    case 2
    AppData.ModT = 'CW No Mod';       
    disp('Continuous wave unmodulated Selected...'); 
    CObject.Pan1.Position = [25 495 250 50]; 
    CObject.PopUp1.Position = [20 5 205 25];
    MakeInvisible();
    Flags.case = 2;
    drawnow
        
        
    case 3
    AppData.ModT = 'Pulse No Mod';          
    disp('Pulse (unmodulated) Selected...');  
    MakeInvisible();
    Flags.case = 3;
    CObject.Pan1.Position = [25 355 250 190]; %[25 429 250 50]
    CObject.PopUp1.Position = [20 145 205 25]; %[20 5 205 25]
    
    DisplayPulseSettings(120);
         
    case 4
    AppData.ModT = 'Pulse No Mod/FHop';      
    disp('Pulse (unmodulated with FRQ Hop) Selected...');  
    MakeInvisible();
       
    Flags.case = 4;
    CObject.Pan1.Position = [25 275 250 270]; 
    CObject.PopUp1.Position = [20 225 205 25]; 
    
    DisplayPulseSettings(195);
    DisplayFHOPSettings(70);
    
    case 5
    AppData.ModT = 'CW/FM';     
    disp('CW (intentional FM) Selected...'); 
    MakeInvisible();
          
    Flags.case = 5;
    
    CObject.Pan1.Position = [25 385 250 160]; 
    CObject.PopUp1.Position = [20 115 205 25]; 
    
    DisplayFMChirpSettings(85);
    
    case 6
    AppData.ModT = 'Pulse/FM';       
    disp('Pulse (intentional FM) Selected...');  
    MakeInvisible();
        
    Flags.case = 6;
    CObject.Pan1.Position = [25 285 250 260]; 
    CObject.PopUp1.Position = [20 215 205 25]; 
    
    DisplayPulseSettings(180);
    DisplayFMChirpSettings(55);
    
    case 7
    AppData.ModT = 'Pulse/FM FHop';        
    disp('Pulse (intentional FM with FRQ Hop) Selected...');  
    MakeInvisible();
    
    Flags.case = 7;
    CObject.Pan1.Position = [25 195 250 350]; 
    CObject.PopUp1.Position = [20 305 205 25];
    
    DisplayPulseSettings(272);
    DisplayFMChirpSettings(142)
    DisplayFHOPSettings(67);
    
    case 8
    AppData.ModT = 'CW/PC';  
    disp('CW (phase coded) Selected...');  
    MakeInvisible();
           
    Flags.case = 8;
    
    CObject.Pan1.Position = [25 385 250 160]; 
    CObject.PopUp1.Position = [20 115 205 25];    
        
    DisplayPhaseChipSettings(80)
    
    case 9
    AppData.ModT = 'Pulse/PC';     
    disp('Pulse (phase coded) Selected...');  
    MakeInvisible();
    
    Flags.case = 9;
    CObject.Pan1.Position = [25 285 250 260]; 
    CObject.PopUp1.Position = [20 215 205 25];
    
    DisplayPulseSettings(182);
    DisplayPhaseChipSettings(57)
    
    case 10
    AppData.ModT = 'Pulse/PC FHop';       
    disp('Pulse (intentional FM with FRQ Hop) Selected...'); 
    MakeInvisible();
        
    Flags.case = 10;
    CObject.Pan1.Position = [25 195 250 350]; 
    CObject.PopUp1.Position = [20 305 205 25];
    
    DisplayPulseSettings(272);
    DisplayPhaseChipSettings(142)
    DisplayFHOPSettings(67);
    
end

AppData.ModType = CObject.PopUp1.Value;

if AppData.ModType > 1
Flags.ModSet = 1;
end

if Flags.RSMSdata
if AppData.FC > 0
Flags.FCSet = 1;
end
end

Flags.GoGo = Flags.ModSet + Flags.FCSet + Flags.RNameSet;

if Flags.GoGo >= 3
CObject.mesub1.Enable = 'on';
CObject.Button.Enable = 'on'; 
end


return


%%%%%%%%%%%%%%%%%%%%%%%%