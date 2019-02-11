function WordEquation(WordCOM,DocHandle,Equation)
%% This Function uses the Equation Editor in Word
DocHandle.OMaths.Add(WordCOM.Selection.Range);
eqn = DocHandle.OMaths.Item(1);
WordCOM.Selection.TypeText(Equation);
WordCOM.Selection.MoveLeft;
eqn.BuildUp()
WordCOM.Selection.MoveDown;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Free Space Propagation Loss Equation
% serverHandle.Selection.TypeText('Pr=(PtGtGr');
% serverHandle.Selection.InsertSymbol(108,'Symbol');
% serverHandle.Selection.TypeText('^2)/(4');  %?
% serverHandle.Selection.InsertSymbol(108,'Symbol');
% serverHandle.Selection.TypeText('d)^2');
% eqn.Functions.Add(serverHandle.Selection.Range,'wdOMathFunctionRad').Rad.HideDeg = 1;
% serverHandle.Selection.TypeText('y');