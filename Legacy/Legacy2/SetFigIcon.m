function SetFigIcon(Hand,Icon)

warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
jframe = get(Hand,'javaframe');
jIcon = javax.swing.ImageIcon(Icon);
jframe.setFigureIcon(jIcon);

return