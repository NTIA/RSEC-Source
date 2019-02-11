function ClosePlotFig(varargin)
global CObject Flags

delete(CObject.PlotFig);
CObject.Button.Enable = 'On';
Flags.Page = 0;

return