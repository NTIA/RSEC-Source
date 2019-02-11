function [header, data] = hdrload(file)

% HDRLOAD Load data from an ASCII file containing a text header.
%     [header, data] = HDRLOAD('filename.ext') reads a data file
%     called 'filename.ext', which contains a text header.  There
%     is no default extension; any extensions must be explicitly
%     supplied.
%
%     The first output, HEADER, is the header information, 
%     returned as a text array.
%     The second output, DATA, is the data matrix.  This data 
%     matrix has the same dimensions as the data in the file, one
%     row per line of ASCII data in the file.  If the data is not
%     regularly spaced (i.e., each line of ASCII data does not 
%     contain the same number of points), the data is returned as
%     a column vector.
%
%     Limitations:  No line of the text header can begin with
%     a number.  Only one header and data set will be read,
%     and the header must come before the data.
%
%     See also LOAD, SAVE, SPCONVERT, FSCANF, FPRINTF, STR2MAT.
%     See also the IOFUN directory.
% check number and type of arguments

if nargin < 1
  error('Function requires one input argument');
elseif ~ischar(file)
  error('Input must be a string representing a filename');
end

fid = fopen(file);

if fid==-1
error('File not found or permission denied');
end

no_lines = 0;
max_line = 0;
ncols = 0;
data = []; %#ok<*NASGU>


% Start processing.
line = fgetl(fid);

if ~ischar(line)
disp('Warning: file contains no header and no data')
end

[data, ~, ~, nxtindex] = sscanf(line, '%f');

while isempty(data)||(nxtindex==1)
  no_lines = no_lines+1;
  max_line = max([max_line, length(line)]);
 
  eval(['line', num2str(no_lines), '=line;']);
  line = fgetl(fid);
  
  if ~ischar(line)
  disp('Warning: file contains no data')
  break
  end
  
  [data, ~, ~, nxtindex] = sscanf(line, '%f');
  
end % while

data = [data; fscanf(fid, '%f')];
fclose(fid);
header = char(' '*ones(no_lines, max_line));

for i = 1:no_lines
  varname = ['line' num2str(i)];
  
  if eval(['length(' varname ')~=0'])
    eval(['header(i, 1:length(' varname ')) = ' varname ';']);
  end
end % for


return
