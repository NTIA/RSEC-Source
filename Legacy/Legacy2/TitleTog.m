function TitleTog(hObject, eventdata, handles)
global AppData CObject

if get(hObject,'Value')
   set(AppData.htitle,'visible','off');
   set(CObject.TogTitle,'BackGroundColor',[0.3 0.75 0.93]); 
else
   set(AppData.htitle,'visible','on');
   set(CObject.TogTitle,'BackGroundColor',[.87 .92 .98]);
end

