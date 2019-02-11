function fhand = RSECReportPlot(RadarName)
global AppData

X = AppData.Fm;
Y = AppData.Sm;

fhand = figure;
plot(X,Y);
hold on
title(['Imported data for ' RadarName])
ylabel('Amplitude (dB)')
xlabel('Frequency (MHz)')

grid minor
ax = gca;
ax.LineWidth = 1.3;


return