%This is the Master Script for reading in the force trace data from file
%and then perform the time allocation optimization for a sequence of traces
%
%Steven Large
%October 5th 2016

function[TimeAlloc,CostTracker,AcceptanceRatio,TimeTracker] = FindTimeAllocation()

%TotalTimes = [100,1000,10000];               %Alter the total times for the proposed protocol

TotalTimes = [1000];                          %Test data on a single total time factor

TimeAlloc = {};
CostTracker = {};
AcceptanceRatio = {};

%dataSetTrace = {'SampleTrajectory_5_N_L-6.0.dat','SampleTrajectory_5_N_L-3.6.dat','SampleTrajectory_5_N_L-1.2.dat','SampleTrajectory_5_N_L1.2.dat','SampleTrajectory_5_N_L3.6.dat'};   %Testing on 5 Step Set

dataSetTrace = {'SampleTrajectory_15_N_L-6.0.dat','SampleTrajectory_15_N_L-5.2.dat','SampleTrajectory_15_N_L-4.4.dat','SampleTrajectory_15_N_L-3.6.dat','SampleTrajectory_15_N_L-2.8.dat','SampleTrajectory_15_N_L-2.0.dat','SampleTrajectory_15_N_L-1.2.dat','SampleTrajectory_15_N_L-0.4.dat','SampleTrajectory_15_N_L0.4.dat','SampleTrajectory_15_N_L1.2.dat','SampleTrajectory_15_N_L2.0.dat','SampleTrajectory_15_N_L2.8.dat','SampleTrajectory_15_N_L3.6.dat','SampleTrajectory_15_N_L4.4.dat','SampleTrajectory_15_N_L5.2.dat'};

%dataSetLambda = {'StepPlacement_5_N.dat'};                   %This is the filename of the associated step placement positions

dataSetLambda = {'StepPlacement_15_N.dat'};                  %Filename of the 15 step placement data

DataCell = {};

for i=1:length(dataSetTrace)

    DataCell{i} = ReadData(dataSetTrace{i});                %Read the Data into a cell array
    
end

DeltaLambda{1} = ReadStepPlacement(dataSetLambda{1});       %Read in the step placements and step placement differences

for k=1:length(TotalTimes)
    
    [TimeAlloc{k},CostTracker{k},AcceptanceRatio{k},TimeTracker{k}] = TemporalOptimization(DataCell,DeltaLambda,TotalTimes(k)); 
    
end


