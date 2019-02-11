function Load_SEAD_DLL ()
%Use this function to load the SEADLib.dll file
%%
NET.addAssembly(fullfile(pwd, 'SEADLib.dll'));
%SLIB = SEADLib.SEADLib;
return
%End