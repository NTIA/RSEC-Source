function RadarData = GetRadarDataFromTable(N)

AppData = MyGlobalAppData();

RadarData.EmitterType = cell2mat(table2cell(AppData.RadarList(N,7))); %Convert to Cell and Extract
RadarData.EmitterPWR = cell2mat(table2cell(AppData.RadarList(N,8)));
RadarData.TXPWRdBm = 10 * log10(1000*RadarData.EmitterPWR);
RadarData.TXRF =  cell2mat(table2cell(AppData.RadarList(N,26)));
RadarData.TXRF = str2double(strsplit(RadarData.TXRF(2:(end-1))));
RadarData.TXRFBW = 2*RadarData.TXRF(1)*1e6;
RadarData.EmitterBW = RadarData.TXRFBW;
RadarData.AntennaGain = cell2mat(table2cell(AppData.RadarList(N,11)));
RadarData.RXAntGain = cell2mat(table2cell(AppData.RadarList(N,12)));


RadarData.RadarName = cell2mat(table2cell(AppData.RadarList(N,1)));
RadarData.RXIF =  cell2mat(table2cell(AppData.RadarList(N,27)));
RadarData.RXIF = str2double(strsplit(RadarData.RXIF(2:(end-1))));
RadarData.RXIFBW = 2*RadarData.RXIF(1)*1e6;
RadarData.RXNoiseFig = cell2mat(table2cell(AppData.RadarList(N,16)));
RadarData.RXSens = cell2mat(table2cell(AppData.RadarList(N,17)));
RadarData.FRQLow = cell2mat(table2cell(AppData.RadarList(N,2)));
RadarData.FRQHigh = cell2mat(table2cell(AppData.RadarList(N,3)));
RadarData.FRQCenter = ceil((RadarData.FRQLow + RadarData.FRQHigh)/2);
RadarData.DOCs = cell2mat(table2cell(AppData.RadarList(N,28)));
RadarData.TXHgt = cell2mat(table2cell(AppData.RadarList(N,13)));
RadarData.RXHgt = cell2mat(table2cell(AppData.RadarList(N,14)));
RadarData.Polarity = cell2mat(table2cell(AppData.RadarList(N,15)));

RadarData.PW = cell2mat(table2cell(AppData.RadarList(N,22)));
RadarData.PRT = cell2mat(table2cell(AppData.RadarList(N,23)));
RadarData.PFT = cell2mat(table2cell(AppData.RadarList(N,24)));
RadarData.PRR = table2cell(AppData.RadarList(N,21));
RadarData.FMBW = cell2mat(table2cell(AppData.RadarList(N,20)));
RadarData.PCR = cell2mat(table2cell(AppData.RadarList(N,19)));
RadarData.CBW = cell2mat(table2cell(AppData.RadarList(N,6)));


return

