function WordSymbol(actx_word_p,symbol_int_p,Symbol_font_str)
%Enter Word_COM and Symbol Number & Symbol Font
%% This funiction inserts symbol in open active document.
actx_word_p.Selection.InsertSymbol(symbol_int_p,Symbol_font_str);
return
%%
%expression .InsertSymbol(CharacterNumber, Font, Unicode, Bias)
%VBA use from MSDN