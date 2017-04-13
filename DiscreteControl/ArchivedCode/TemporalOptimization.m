%this script is the workhorse optimization scheme for the time allocation
%code, it takes in all the data sets as well as the total time, and finds
%the optimal time allocation between the different windows as predicted by
%theory
%
%Steven Large
%October 5th 2016

function[TimeAlloc,CostTrackerArray,Acc_Ratio,TimeTracker] = TemporalOptimization(DataCell,DeltaLambda,TotalTime)

figure

for k=1:length(DataCell)-1                              %We don't care about the force autocorrelation of the final positiona as this is not something we have to do work against
    
    ACF{k} = var(DataCell{k})*autocorr(DataCell{k},900);
    subplot(1,2,1)
    hold on
    plot(ACF{k});
    subplot(1,2,2)
    hold on
    plot(DataCell{k});
    
    
end

%RandInit = abs(rand(length(ACF),1));

%NormConst = sum(RandInit);
%AdjustFactor = TotalTime/NormConst;                     %Ensure the total time of the initial condition is fixed

%RandInit = RandInit.*AdjustFactor;                      %Begin each optimization with a random inital condition to investigate robustness

RandInit = ones(length(ACF),1);

EqualTimes = TotalTime/length(ACF);

RandInit = RandInit*EqualTimes;                         %Begin with a uniform time distribution

Cost = CalculateCost(ACF,DeltaLambda,RandInit);

CostTracker = {};
TimeTracker = zeros(1,20000);

TimeAlloc = RandInit;

AcceptanceCounter = 0;
StepCounter = 0;

for k=1:20000
   
    [NewTimeAlloc,TimeTrack] = temporalAdjust3(TimeAlloc);

    CostOld = Cost;
    
    TimeTracker(k) = TimeTrack;
    
    CostNew = CalculateCost(ACF,DeltaLambda,NewTimeAlloc);
    
    if CostNew < CostOld
        
       Cost = CostNew;
       AcceptanceCounter = AcceptanceCounter + 1;
       TimeAlloc = NewTimeAlloc; 
       
    end
    
    StepCounter = StepCounter + 1;
    
    CostTracker{k} = Cost;
    
end

CostTrackerArray = [CostTracker{:}];

Acc_Ratio = AcceptanceCounter/StepCounter;

