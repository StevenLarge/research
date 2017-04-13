%This script find the optimal step allocation based on the principle of
%equal Fisher information
%
%Steven Large
%September 14th 2016

NumberStep = [5,10,15,20,25,50];

%NumberStep = [10];

StepRange = 12;                     %This is the range from the smallest to largest control parameter values

UpperBound = 6;
LowerBound = -6;

InfoRange = FisherCumulative(end) - FisherCumulative(1);

StepPlacementsOpt = {};
StepPlacementsNaive = {};

for i=1:length(NumberStep)
    
    StepSize = InfoRange/NumberStep(i);
    
    NStep = NumberStep(i);
    
    Accumulator = 0;
    
    for k=1:NStep
    
        temp = [abs(FisherCumulative - Accumulator)];
        
        [holder, idx] = min(temp);
        
        Coord = dXI(idx);
        
        StepPlacementsOpt{i}{k} = Coord;
        
        Accumulator = Accumulator + StepSize;
        
    end
    
    StepPlacementsOpt{i}{NStep+1} = UpperBound;
    
end

for i=1:length(NumberStep)
       
    StepSize = StepRange/NumberStep(i); 
    
    NStep = NumberStep(i);
    
    Accumulator = LowerBound;
    
    for k=1:NStep
        
        Coord = Accumulator;
        
        StepPlacementsNaive{i}{k} = Coord;
    
        Accumulator = Accumulator + StepSize;
    
    end
    
    StepPlacementsNaive{i}{NStep+1} = UpperBound;
        
end


