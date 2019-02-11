function pg1_Callback(hObject, eventdata, handles)
global AppData CObject

AppData.PG = str2num(CObject.PgB1.String);

refresh;

