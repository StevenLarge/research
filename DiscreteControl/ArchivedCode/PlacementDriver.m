%This script runs teh required subroutines to calcualtate the optimal
%placement of steps based on teh cumulative Fisher Information
%
%Steven Large
%October 12th 2016

%========================== FisherInformation ============================%

beta = 1.5;
m = 6;
dE = 4;
ksys = 1;
ktrap = 1;

Start = -6;
Range = 12;

kch = ktrap*ksys/(ktrap + ksys);

NumberSteps = Range/1000;

dXL = [-15:(30/30000):15];
dXI = [-6:(12/10000):6];

Energy = -(1/beta)*log(exp(-0.5*ksys*beta*(dXL + m).^2) + exp(-beta*(0.5*ksys*(dXL - m).^2 + dE)));

Fisher = (1/beta)*((ktrap/(1 + ksys/ktrap)) + kch*m*sech(beta*(kch*m.*dXI - 0.5*dE)));

FisherCumulative = cumtrapz(dXI,Fisher);

%=============================== StepPlacement ===========================%

NumberStep = [5,10,15,20,25,50];

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

%============================= WritePlacements ==========================%

cd StepPlacementData

TempNaive1 = [StepPlacementsNaive{1}{:}];

fileID_5_N = fopen('StepPlacement_5_N.txt','w');
fprintf(fileID_5_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive1)
    fprintf(fileID_5_N,'%d\t',i);
    fprintf(fileID_5_N,'%f\n',TempNaive1(i));
end

TempNaive2 = [StepPlacementsNaive{2}{:}];

fileID_10_N = fopen('StepPlacement_10_N.txt','w');
fprintf(fileID_10_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive2)
    fprintf(fileID_10_N,'%d\t',i);
    fprintf(fileID_10_N,'%f\n',TempNaive2(i));
end

TempNaive3 = [StepPlacementsNaive{3}{:}];

fileID_15_N = fopen('StepPlacement_15_N.txt','w');
fprintf(fileID_15_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive3)
    fprintf(fileID_15_N,'%d\t',i);
    fprintf(fileID_15_N,'%f\n',TempNaive3(i));
end

TempNaive4 = [StepPlacementsNaive{4}{:}];

fileID_20_N = fopen('StepPlacement_20_N.txt','w');
fprintf(fileID_20_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive4)
    fprintf(fileID_20_N,'%d\t',i);
    fprintf(fileID_20_N,'%f\n',TempNaive4(i));  
end

TempNaive5 = [StepPlacementsNaive{5}{:}];

fileID_25_N = fopen('StepPlacement_25_N.txt','w');
fprintf(fileID_25_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive5)
    fprintf(fileID_25_N,'%d\t',i);
    fprintf(fileID_25_N,'%f\n',TempNaive5(i));
end

TempNaive6 = [StepPlacementsNaive{6}{:}];

fileID_50_N = fopen('StepPlacement_50_N.txt','w');
fprintf(fileID_50_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive6)
    fprintf(fileID_25_N,'%d\t',i);
    fprintf(fileID_25_N,'%f\n',TempNaive6(i));
end



TempOpt1 = [StepPlacementsOpt{1}{:}];

fileID_5_O = fopen('StepPlacement_5_O.txt','w');
fprintf(fileID_5_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt1)
    fprintf(fileID_5_O,'%d\t',i);
    fprintf(fileID_5_O,'%f\n',TempNaive1(i));
end

TempOpt2 = [StepPlacementsOpt{2}{:}];

fileID_10_O = fopen('StepPlacement_10_O.txt','w');
fprintf(fileID_10_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt2)
    fprintf(fileID_10_O,'%d\t',i);
    fprintf(fileID_10_O,'%f\n',TempNaive2(i));
end

TempOpt3 = [StepPlacementsOpt{3}{:}];

fileID_15_O = fopen('StepPlacement_15_O.txt','w');
fprintf(fileID_15_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt3)
    fprintf(fileID_15_O,'%d\t',i);
    fprintf(fileID_15_O,'%f\n',TempNaive3(i));
end

TempOpt4 = [StepPlacementsOpt{4}{:}];

fileID_20_O = fopen('StepPlacement_20_O.txt','w');
fprintf(fileID_20_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt4)
    fprintf(fileID_20_O,'%d\t',i);
    fprintf(fileID_20_O,'%f\n',TempNaive4(i));
end

TempOpt5 = [StepPlacementsOpt{5}{:}];

fileID_25_O = fopen('StepPlacement_25_O.txt','w');
fprintf(fileID_25_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt5)
    fprintf(fileID_25_O,'%d\t',i);
    fprintf(fileID_25_O,'%f\n',TempNaive5(i));
end

TempOpt6 = [StepPlacementsOpt{6}{:}];

fileID_50_O = fopen('StepPlacement_50_O.txt','w');
fprintf(fileID_50_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt6)
    fprintf(fileID_50_O,'%d\t',i);
    fprintf(fileID_50_O,'%f\n',TempNaive6(i));
end

cd ..


