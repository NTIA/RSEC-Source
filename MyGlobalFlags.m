        function Flags = MyGlobalFlags(Name,Value)
        persistent Flags_

        if isempty(Flags_)
        Flags_.case = 0;
        Flags_.SpanSet = 0;
        Flags_.CustomPage = 1;
        Flags_.SpecAnData = 0;
        Flags_.GoGo = 0;
        Flags_.RSMSdata = 0;
        Flags_.ModSet = 0;
        Flags_.FCSet = 0;
        Flags_.RNameSet = 0;
        Flags_.RSEC_A1 = 0;
        Flags_.TextData = 0;
        Flags_.ManData = 0;
        Flags_.ModData = 0;
        Flags_.Page = 0;
        Flags_.ViewOnly = 0;
        Flags_.LegacyHold = 0;
        Flags_.RC = 0;
        Flags_.CSW = 0;
        Flags_.OverUnder = 0;
        Flags_.AnalysisReady(1)=0;
        Flags_.AnalysisReady(2)=0; 
        Flags_.Normalize = 0;
        Flags_.ImportedData = 0;
        Flags_.MeasuredData = 0;
        Flags_.RunRSEC = 0;
        Flags_.NewStart = 0;
        end    
        if nargin == 2
        Flags_.(Name) = Value;
        end
        
        if nargin == 1 
          Flags_ = Name;
        end
        
        Flags = Flags_;
        app = app; %#ok;
        end