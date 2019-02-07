function AppData = SelectEDesignatorRSEC(AppData)

AppData.EDesign = EmitterDesignatorDLG;    
NumED = length(AppData.TXEDS);  
AppData.TXEDSData = AppData.TXEDS;

switch NumED 
    
    case 1
    AppData.EDesign.Button1.Text = AppData.TXEDSData{1};
    AppData.EDesign.Button2.Visible = 'off';
    AppData.EDesign.Button3.Visible = 'off';
    AppData.EDesign.Button4.Visible = 'off';
    AppData.EDesign.Button5.Visible = 'off';
    AppData.EDesign.Button6.Visible = 'off';
    AppData.EDesign.Button7.Visible = 'off';   
    AppData.EDesign.Button8.Visible = 'off';
    AppData.EDesign.Button9.Visible = 'off'; 
    case 2
    AppData.EDesign.Button1.Text = AppData.TXEDSData{1};
    AppData.EDesign.Button2.Text = AppData.TXEDSData{2};
    AppData.EDesign.Button3.Visible = 'off';
    AppData.EDesign.Button4.Visible = 'off';
    AppData.EDesign.Button5.Visible = 'off';
    AppData.EDesign.Button6.Visible = 'off';
    AppData.EDesign.Button7.Visible = 'off';   
    AppData.EDesign.Button8.Visible = 'off';
    AppData.EDesign.Button9.Visible = 'off'; 
    case 3
    AppData.EDesign.Button1.Text = AppData.TXEDSData{1};
    AppData.EDesign.Button2.Text = AppData.TXEDSData{2};
    AppData.EDesign.Button3.Text = AppData.TXEDSData{3};
    AppData.EDesign.Button4.Visible = 'off';
    AppData.EDesign.Button5.Visible = 'off';
    AppData.EDesign.Button6.Visible = 'off';
    AppData.EDesign.Button7.Visible = 'off';  
    AppData.EDesign.Button8.Visible = 'off';
    AppData.EDesign.Button9.Visible = 'off'; 
    case 4
    AppData.EDesign.Button1.Text = AppData.TXEDSData{1};
    AppData.EDesign.Button2.Text = AppData.TXEDSData{2};
    AppData.EDesign.Button3.Text = AppData.TXEDSData{3};
    AppData.EDesign.Button4.Text = AppData.TXEDSData{4};
    AppData.EDesign.Button5.Visible = 'off';
    AppData.EDesign.Button6.Visible = 'off';
    AppData.EDesign.Button7.Visible = 'off'; 
    AppData.EDesign.Button8.Visible = 'off';
    AppData.EDesign.Button9.Visible = 'off'; 
    case 5
    AppData.EDesign.Button1.Text = AppData.TXEDSData{1};
    AppData.EDesign.Button2.Text = AppData.TXEDSData{2};
    AppData.EDesign.Button3.Text = AppData.TXEDSData{3};
    AppData.EDesign.Button4.Text = AppData.TXEDSData{4};
    AppData.EDesign.Button5.Text = AppData.TXEDSData{5};
    AppData.EDesign.Button6.Visible = 'off';
    AppData.EDesign.Button7.Visible = 'off';    
    AppData.EDesign.Button8.Visible = 'off';
    AppData.EDesign.Button9.Visible = 'off'; 
    case 6
    AppData.EDesign.Button1.Text = AppData.TXEDSData{1};
    AppData.EDesign.Button2.Text = AppData.TXEDSData{2};
    AppData.EDesign.Button3.Text = AppData.TXEDSData{3};
    AppData.EDesign.Button4.Text = AppData.TXEDSData{4};
    AppData.EDesign.Button5.Text = AppData.TXEDSData{5};
    AppData.EDesign.Button6.Text = AppData.TXEDSData{6};
    AppData.EDesign.Button7.Visible = 'off';  
    AppData.EDesign.Button8.Visible = 'off';
    AppData.EDesign.Button9.Visible = 'off'; 
    case 7
    AppData.EDesign.Button1.Text = AppData.TXEDSData{1};
    AppData.EDesign.Button2.Text = AppData.TXEDSData{2};
    AppData.EDesign.Button3.Text = AppData.TXEDSData{3};
    AppData.EDesign.Button4.Text = AppData.TXEDSData{4};
    AppData.EDesign.Button5.Text = AppData.TXEDSData{5};
    AppData.EDesign.Button6.Text = AppData.TXEDSData{6};
    AppData.EDesign.Button7.Text = AppData.TXEDSData{7};
    AppData.EDesign.Button8.Visible = 'off';
    AppData.EDesign.Button9.Visible = 'off'; 
    case 8
    AppData.EDesign.Button1.Text = AppData.TXEDSData{1};
    AppData.EDesign.Button2.Text = AppData.TXEDSData{2};
    AppData.EDesign.Button3.Text = AppData.TXEDSData{3};
    AppData.EDesign.Button4.Text = AppData.TXEDSData{4};
    AppData.EDesign.Button5.Text = AppData.TXEDSData{5};
    AppData.EDesign.Button6.Text = AppData.TXEDSData{6};
    AppData.EDesign.Button7.Text = AppData.TXEDSData{7};
    AppData.EDesign.Button8.Text = AppData.TXEDSData{8};
    AppData.EDesign.Button9.Visible = 'off'; 
    case 9
    AppData.EDesign.Button1.Text = AppData.TXEDSData{1};
    AppData.EDesign.Button2.Text = AppData.TXEDSData{2};
    AppData.EDesign.Button3.Text = AppData.TXEDSData{3};
    AppData.EDesign.Button4.Text = AppData.TXEDSData{4};
    AppData.EDesign.Button5.Text = AppData.TXEDSData{5};
    AppData.EDesign.Button6.Text = AppData.TXEDSData{6};
    AppData.EDesign.Button7.Text = AppData.TXEDSData{7};
    AppData.EDesign.Button8.Text = AppData.TXEDSData{8};
    AppData.EDesign.Button9.Text = AppData.TXEDSData{9}; 
    otherwise
    return    
   
end    


waitfor(AppData.EDesign);

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%