function criteria1_Callback(hObject, eventdata, handles)
global AppData

contents = get(hObject,'String');
AppData.Criteria=cell2mat(contents(get(hObject,'Value')));

if sum(strcmp(AppData.Criteria,{'' 'A' 'F'}))
   AppData.bwRSECn=[];
   set(AppData.bwRSECn1,'string',num2str(AppData.bwRSECn));
   AppData.nSlope=0;
   set(AppData.slope1,'string',num2str(AppData.nSlope));
else
   if isempty(AppData.bwRSECn)
      AppData.bwRSECn=newRSECbw(handles);
      set(AppData.bwRSECn1,'string',num2str(AppData.bwRSECn));
   end
   if AppData.nSlope==0
      if strcmp(AppData.Criteria,'D')
         AppData.nSlope=40;
      else
         AppData.nSlope=30;
      end
      set(AppData.slope1,'string',num2str(AppData.nSlope));
   end
end
AppData.bwRSECo=oldRSECbw(handles);

handles=updateMask(handles);

guidata(hObject, handles);