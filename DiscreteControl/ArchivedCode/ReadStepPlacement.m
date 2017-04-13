%This script reads in teh step placement positions from file and then
%calculates the various Delta Lambda terms for the optimization scheme
%
%Steven Large
%October 5th 2016

function[DeltaLambda] = ReadStepPlacement(filename)

cd StepPlacementData

fileID = fopen(filename,'r');

formatSpec = '%f';

StepPlacements = fscanf(fileID,formatSpec);

SP_minus = StepPlacements(1:end-1);             
SP_plus = StepPlacements(2:end);

DeltaLambda = SP_plus - SP_minus;               %Calcualte Delta Lambda terms

cd ..



