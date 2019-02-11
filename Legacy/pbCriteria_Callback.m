function pbCriteria_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.Criteria = nRSECcriteria(AppData);
CObject.CPU.Value = Criteria2SelCriteria(AppData.Criteria);
AppData.bwRSECo=oldRSECbw(AppData);
AppData = updateMask(AppData);
CObject.Criteria.Value = 0;

return
