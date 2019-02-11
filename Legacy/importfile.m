function newData = importfile(fileToRead1)%IMPORTFILE(FILETOREAD1)
%  Imports data from the specified file
%  FILETOREAD1:  file to read

%  Auto-generated by MATLAB on 05-Oct-2016 18:04:31

% Import the file
newData = load('-mat', fileToRead1);

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData);
for i = 1:length(vars)
    assignin('base', vars{i}, newData.(vars{i}));
end

