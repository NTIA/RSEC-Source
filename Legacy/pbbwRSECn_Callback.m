function pbbwRSECn_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.bwRSECn=newRSECbw(AppData);
CObject.BWCnEB1.String = num2str(AppData.bwRSECn);

AppData = updateMask(AppData);
CObject.BWCndB.Value = 0;

return