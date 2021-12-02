% this will upload the XRF/pyrolysis data and spit out variables by
% location as a matrix

%load the variable names vector. this will not change
load('C:\Users\duckm\OneDrive\BYU Fall 2021\Geodata_Bickmore\ShaleGeochemistry\vMowryVariables.mat');


cSampLoc = cell(9:1);

%names by location
cAreaNames = cell(9:1);
cAreaNames{1} = "WRB1";
cAreaNames{2} = "WRB2";
cAreaNames{3} = "WRB3";
cAreaNames{4} = "WRB4";
cAreaNames{5} = "WRB5";
cAreaNames{6} = "WRB6";
cAreaNames{7} = "WRB7";
cAreaNames{8} = "HB1";
cAreaNames{9} = "HB2";

%define options for importing
opts = detectImportOptions('MowryShaleJanuaryCompiled_v13.xlsx');
opts.Sheet = 'Composite';

%Import data from WRB1 as a matrix
opts.SelectedVariableNames = [7:17 21:43 46:67]; 
    opts.DataRange = '5:25';
cSampLoc{1} = readmatrix('MowryShaleJanuaryCompiled_v13.xlsx',opts);
%Import sample titles and data type as two vectors
    opts.SelectedVariableNames = [2];
vWRB1Samp = readvars('MowryShaleJanuaryCompiled_v13.xlsx', opts);

%Import data from WRB2 as a matrix
    opts.SelectedVariableNames = [7:17 21:43 46:67]; 
    opts.DataRange = '26:156';
cSampLoc{2} = readmatrix('MowryShaleJanuaryCompiled_v13.xlsx',opts);
%Import sample titles and data type as two vectors
    opts.SelectedVariableNames = [2];
vWRB2Samp = readvars('MowryShaleJanuaryCompiled_v13.xlsx', opts);

%Import data from WRB3 as a matrix
    opts.SelectedVariableNames = [7:17 21:43 46:67]; 
    opts.DataRange = '157:218';
cSampLoc{3} = readmatrix('MowryShaleJanuaryCompiled_v13.xlsx',opts);
%Import sample titles and data type as two vectors
    opts.SelectedVariableNames = [2];
vWRB3Samp = readvars('MowryShaleJanuaryCompiled_v13.xlsx', opts);

%Import data from WRB4 as a matrix
    opts.SelectedVariableNames = [7:17 21:43 46:67]; 
    opts.DataRange = '219:225';
cSampLoc{4} = readmatrix('MowryShaleJanuaryCompiled_v13.xlsx',opts);
%Import sample titles and data type as two vectors
    opts.SelectedVariableNames = [2];
vWRB4Samp = readvars('MowryShaleJanuaryCompiled_v13.xlsx', opts);

%Import data from WRB5 as a matrix
    opts.SelectedVariableNames = [7:17 21:43 46:67]; 
    opts.DataRange = '226:252';
cSampLoc{5} = readmatrix('MowryShaleJanuaryCompiled_v13.xlsx',opts);
%Import sample titles and data type as two vectors
    opts.SelectedVariableNames = [2];
vWRB5Samp = readvars('MowryShaleJanuaryCompiled_v13.xlsx', opts);

%Import data from WRB6 as a matrix
    opts.SelectedVariableNames = [7:17 21:43 46:67]; 
    opts.DataRange = '253:299';
cSampLoc{6} = readmatrix('MowryShaleJanuaryCompiled_v13.xlsx',opts);
%Import sample titles and data type as two vectors
    opts.SelectedVariableNames = [2];
vWRB6Samp = readvars('MowryShaleJanuaryCompiled_v13.xlsx', opts);

%Import data from WRB7 as a matrix
    opts.SelectedVariableNames = [7:17 21:43 46:67]; 
    opts.DataRange = '300:325';
cSampLoc{7} = readmatrix('MowryShaleJanuaryCompiled_v13.xlsx',opts);
%Import sample titles and data type as two vectors
    opts.SelectedVariableNames = [2];
vWRB7Samp = readvars('MowryShaleJanuaryCompiled_v13.xlsx', opts);

%Import data from HB1 as a matrix
    opts.SelectedVariableNames = [7:17 21:43 46:67]; 
    opts.DataRange = '326:363';
cSampLoc{8} = readmatrix('MowryShaleJanuaryCompiled_v13.xlsx',opts);
%Import sample titles and data type as two vectors
    opts.SelectedVariableNames = [2];
vHB1Samp = readvars('MowryShaleJanuaryCompiled_v13.xlsx', opts);

%Import data from WHB2 as a matrix
    opts.SelectedVariableNames = [7:17 21:43 46:67]; 
    opts.DataRange = '364:380';
cSampLoc{9} = readmatrix('MowryShaleJanuaryCompiled_v13.xlsx',opts);
%Import sample titles and data type as two vectors
    opts.SelectedVariableNames = [2];
vHB2Samp = readvars('MowryShaleJanuaryCompiled_v13.xlsx', opts);

%this section is for PCA
%import all the location data in one matrix
%define options for importing
opts = detectImportOptions('MowryShaleJanuaryCompiled_v13.xlsx');
opts.Sheet = 'Composite';
opts.SelectedVariableNames = [1:1 7:17 21:43 46:67]; 
opts.DataRange = '5:380';
mSampData = readmatrix('MowryShaleJanuaryCompiled_v13.xlsx',opts);
%pull out location area into a vector
vLocations = mSampData(:,1);
mSampData = mSampData(:,2:end);
