function SetSPSNum(varargin)
global CObject AppData MRData

AppData.SPSNumb = CObject.EBox2.String;
MRData.SPSNumb = AppData.SPSNumb;

SetSPSDat();

return