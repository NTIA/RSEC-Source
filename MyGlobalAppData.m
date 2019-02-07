       function AppData = MyGlobalAppData(Name,Value)
       persistent AppData_

        if isempty(AppData_)%First pass is an Initialization
        AppData_.Criteria = [];
        AppData_.Bs = [];
        AppData_.PG = [];
        AppData_.xmin1 = [];
        AppData_.xmax1 = [];
        AppData_.ModT = [];
        AppData_.ImportPath = [];
        AppData_.Fm = [];
        AppData_.Sm = [];
        AppData_.oo = [];
        AppData_.uu = [];
        AppData_.RadarFName = [];
        AppData_.ImportPath = [];
        AppData_.OutDir = 0; 
        AppData_.FRQLow = '0000.0';
        AppData_.FRQHi = '0000.0';
        end 
        
        if nargin == 2
        AppData_.(Name) = Value;
        end
        
        if nargin == 1 
        AppData_ = Name;
        end
        
        AppData = AppData_;
                
       end  