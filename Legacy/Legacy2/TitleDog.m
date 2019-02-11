function TitleDog(Flag)
global AppData 

if Flag
   set(AppData.htitle,'visible','off');
else
   set(AppData.htitle,'visible','on');
end

