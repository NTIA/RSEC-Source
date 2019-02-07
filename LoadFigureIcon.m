function LoadFigureIcon(FigHand,ICON)
warning('off','all');
pause(1);
figProps = struct(FigHand);
controller = figProps.Controller;
controllerProps = struct(controller);
platformHost = controllerProps.PlatformHost;
platformHostProps = struct(platformHost);
win = platformHostProps.CEF;
win.Icon = [pwd '\' ICON];
return

% hFigs = findall(groot, 'Type', 'figure');
% hUIFigs = hFigs(arrayfun(@(x)isstruct(struct(x).ControllerInfo), hFigs));

% FigHand = findall(groot, 'Type', 'figure');
% figProps = struct(FigHand);
% controller = figProps.Controller;      
% controllerProps = struct(controller);
% container = controllerProps.Container;  

% C = getundoc(FigHand);
% win = struct(C);
% jframe = win.JavaFrame;
% IconLocation = [pwd '\' ICON];
% jIcon=javax.swing.ImageIcon(IconLocation);
% jframe.setFigureIcon(jIcon); 
