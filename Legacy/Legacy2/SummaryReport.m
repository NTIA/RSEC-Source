%This script creates a test report
%% Start by creating a Word Document
global AppData Setup Flags

% 0.0 Collect Table Stuff
SysTab1 = AppData.SysTab1;
SysTab2 = AppData.SysTab2;

% Collect report varibles
MyHead1 = AppData.TabHead1;
MyHead2 = AppData.TabHead2;

% 1.0 Create Word Document
Word_COM = actxserver('Word.Application');
set(Word_COM,'visible',1);
RAM_Report = invoke(Word_COM.documents,'add');
invoke(RAM_Report.paragraphs,'add');
ReportDoc = Word_COM.Selection;
MyRadar = AppData.RadarFName;

% ReportDoc Created 
%% 2.0 Set Title and Intro Text
    ReportDoc.Font.Name = 'Times New Roman';
    ReportDoc.Font.Size = 16;
    ReportDoc.Font.Bold = 1;
    ReportDoc.Paragraphs.Alignment = 1;
    MyTextWithLineFeed = sprintf('%s\n','NTIA RSEC Compliance Program (RCP)');
    ReportDoc.TypeText( MyTextWithLineFeed );
    MyTextWithLineFeed = sprintf('%s\n',['Summary Report ' MyRadar]);
    ReportDoc.Font.Size = 18;
    ReportDoc.TypeText( MyTextWithLineFeed );
    ReportDoc.Font.Size = 12;
    ReportDoc.InsertDateTime;
    NewLines(1,ReportDoc);
    ReportDoc.TypeParagraph;
    
    RD = 'The following suppression formula is used to create the RSEC Radio Frequency Masks:';
    
    ReportDoc.Font.Size = 12;
    ReportDoc.Font.Bold = 0;
    ReportDoc.Paragraphs.Alignment = 1;
    ReportDoc.TypeText(RD);
    NewLines(2,ReportDoc);
    
    ReportDoc.Font.Size = 12;
    ReportDoc.Font.Bold = 1;
    ReportDoc.Paragraphs.Alignment = 1;
    Eqn1 = 'Suppression(dB)= -S*Log|(F-F_o)/(1/2 B(-40dB) )|-40';
    WordEquation(Word_COM,RAM_Report,Eqn1);
    ReportDoc.Style = 'No Spacing';ReportDoc.Font.Bold = 1;
    
    RD = 'Where:';
    ReportDoc.Paragraphs.Alignment = 0;
    NewLines(2,ReportDoc);
    ReportDoc.TypeText(RD);
    NewLines(2,ReportDoc);
    ReportDoc.Font.Bold = 0;
    MyTextWithLineFeed = sprintf('%s\n','Suppression (dB) is the RF Mask;');
    ReportDoc.TypeText( MyTextWithLineFeed );
    NewLines(1,ReportDoc);
    A1 = '%s\n';
    A2 = Setup.Slope;
    formatSpec = 'S = Suppression Slope with Legacy set at %s dB/Dec';
    MyTextWithLineFeed = sprintf(formatSpec,A2);
    ReportDoc.TypeText( MyTextWithLineFeed );
    NewLines(1,ReportDoc);
    
    formatSpec = 'F = Frequency on Interest (MHz)';
    MyTextWithLineFeed = sprintf(formatSpec);
    MyTextWithLineFeed = sprintf(A1,MyTextWithLineFeed);
    ReportDoc.TypeText( MyTextWithLineFeed );
    
    
    formatSpec = 'Fo = Center Frequency (MHz)';
    MyTextWithLineFeed = sprintf(formatSpec);
    MyTextWithLineFeed = sprintf(A1,MyTextWithLineFeed);
    ReportDoc.TypeText( MyTextWithLineFeed );
    
    
    formatSpec = 'B(-40) = Band Width (MHz) at -40 dB Suppression value ';
    MyTextWithLineFeed = sprintf(formatSpec);
    MyTextWithLineFeed = sprintf(A1,MyTextWithLineFeed);
    ReportDoc.TypeText( MyTextWithLineFeed );
    NewLines(1,ReportDoc);
    
    Word_COM.Selection.InsertBreak; %Insert Page Break

    
%Titles Finished Go to Next Page;
%% 3.0 Create Table
    ReportDoc.Paragraphs.Alignment = 1;
    ReportDoc.Font.Name = 'Times New Roman';
    ReportDoc.Font.Size = 10;
    ReportDoc.Font.Bold = 1;

TableHead = 'RSEC System Table';
TableHead2 = ['Note: This table is based on ' MyRadar ' Inputs.'];
TableHead = char(TableHead); 
TableHead = sprintf('%s\n',TableHead);
ReportDoc.Paragraphs.Alignment = 1;
TableHead2 = sprintf('%s\n',TableHead2);
ReportDoc.TypeText(TableHead);
ReportDoc.Font.Italic = 1;
ReportDoc.TypeText(TableHead2);
ReportDoc.Font.Italic = 0;


[NoRows,NoCols] = size(SysTab1);

    ReportDoc.Paragraphs.Alignment = 0;
    ReportDoc.Font.Name = 'Times New Roman';
    ReportDoc.Font.Size = 7;
    ReportDoc.Font.Bold = 1;
    ReportDoc.Font.ColorIndex = 'wdBlack';
      
WordCreateTable(Word_COM,NoRows,NoCols,SysTab1,1,MyHead1);

ReportDoc.Paragraphs.Alignment = 1;
NewLines(2,ReportDoc);
% Word_COM.Selection.InsertBreak; %Insert Page Break

%% 3.1 Create Table 2

    ReportDoc.Paragraphs.Alignment = 1;
    ReportDoc.Font.Name = 'Times New Roman';
    ReportDoc.Font.Size = 10;
    ReportDoc.Font.Bold = 1;

TableHead = strcat('Processed Data for:',{' '},MyRadar);
TableHead = char(TableHead); 
TableHead = sprintf('%s \n',TableHead);
ReportDoc.TypeText(TableHead);

[NoRows,NoCols] = size(SysTab2);

    ReportDoc.Paragraphs.Alignment = 0;
    ReportDoc.Font.Name = 'Times New Roman';
    ReportDoc.Font.Size = 7;
    ReportDoc.Font.Bold = 1;
    ReportDoc.Font.ColorIndex = 'wdBlack';
    
WordCreateTable(Word_COM,NoRows,NoCols,SysTab2,1,MyHead2);
    
ReportDoc.Paragraphs.Alignment = 1;

if Flags.TextData
%New Page
Word_COM.Selection.InsertBreak; %Insert Page Break
%% 3.0  Create Plot 1
h = RSECReportPlot(MyRadar);
  print(h,'-dmeta')
  ReportDoc.Paragraphs.Alignment = 1;
  ReportDoc.Paste();
  close(h);

NewLines(1,ReportDoc);
FigTag = sprintf('%s', 'Figure 1');
ReportDoc.Font.Size = 11;
ReportDoc.Font.Bold = 0;
ReportDoc.Font.ColorIndex = 'wdBlack';
ReportDoc.Paragraphs.Alignment = 1;
ReportDoc.TypeText(FigTag);
end
NewLines(3,ReportDoc)    
%% Finish up

ReportDoc.Font.Size = 9;
ReportDoc.Font.Bold = 0;
ReportDoc.Paragraphs.Alignment = 0;
ReportDoc.TypeText('End of Report...');

disp('Finished Test Report!')
 
%%
%End
