function NewLines(N, DocTag)
%Enter the number of lines to add as well as the Document Tag or ID...
for j = 1:N
Newlines = sprintf('\n'); 
DocTag.TypeText(Newlines) 
end

%%%good info on scaling a pasted figure
% Pastespecial as Shape
% ReportDoc.PasteSpecial(0,0,1,0,3)
% ReportDoc.ShapeRange.Width = 1*72;     % width = 1inch
% ReportDoc.Shaperange.ConvertToInlineShape
% ReportDoc.Start = h.selection.Start+1;
% ReportDoc.End = h.selection.End+1;
% End notification (optional)
%ReportDoc.TypeText('end')