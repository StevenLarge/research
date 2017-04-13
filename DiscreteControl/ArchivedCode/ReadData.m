%This script reads in the Force trace functions from a data file and loads
%them into a cell array
%
%Steven Large
%October 5th 2016

function[TraceData] = ReadData(filename)

cd TraceData

fileID = fopen(filename,'r');

formatSpec = '%f';

TraceData = fscanf(fileID,formatSpec);

fclose(fileID);

cd ..

