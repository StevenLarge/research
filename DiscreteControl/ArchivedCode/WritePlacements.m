%This script prints the step placement lambda values to a test file
%
%Steven Large
%September 28th 2016

cd StepPlacementData

fileID_5_N = fopen('StepPlacement_5_N.txt','w');
fprintf(fileID_5_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive1)
    fprintf(fileID_5_N,'%d\t',i);
    fprintf(fileID_5_N,'%f\n',TempNaive1(i));
end


fileID_10_N = fopen('StepPlacement_10_N.txt','w');
fprintf(fileID_10_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive2)
    fprintf(fileID_10_N,'%d\t',i);
    fprintf(fileID_10_N,'%f\n',TempNaive2(i));
end


fileID_15_N = fopen('StepPlacement_15_N.txt','w');
fprintf(fileID_15_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive3)
    fprintf(fileID_15_N,'%d\t',i);
    fprintf(fileID_15_N,'%f\n',TempNaive3(i));
end


fileID_20_N = fopen('StepPlacement_20_N.txt','w');
fprintf(fileID_20_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive4)
    fprintf(fileID_20_N,'%d\t',i);
    fprintf(fileID_20_N,'%f\n',TempNaive4(i));  
end


fileID_25_N = fopen('StepPlacement_25_N.txt','w');
fprintf(fileID_25_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive5)
    fprintf(fileID_25_N,'%d\t',i);
    fprintf(fileID_25_N,'%f\n',TempNaive5(i));
end


fileID_50_N = fopen('StepPlacement_50_N.txt','w');
fprintf(fileID_50_N,'Index\tLambda Value\n\n');
for i=1:length(TempNaive6)
    fprintf(fileID_50_N,'%d\t',i);
    fprintf(fileID_50_N,'%f\n',TempNaive6(i));
end



fileID_5_O = fopen('StepPlacement_5_O.txt','w');
fprintf(fileID_5_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt1)
    fprintf(fileID_5_O,'%d\t',i);
    fprintf(fileID_5_O,'%f\n',TempNaive1(i));
end


fileID_10_O = fopen('StepPlacement_10_O.txt','w');
fprintf(fileID_10_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt2)
    fprintf(fileID_10_O,'%d\t',i);
    fprintf(fileID_10_O,'%f\n',TempNaive2(i));
end


fileID_15_O = fopen('StepPlacement_15_O.txt','w');
fprintf(fileID_15_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt3)
    fprintf(fileID_15_O,'%d\t',i);
    fprintf(fileID_15_O,'%f\n',TempNaive3(i));
end


fileID_20_O = fopen('StepPlacement_20_O.txt','w');
fprintf(fileID_20_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt4)
    fprintf(fileID_20_O,'%d\t',i);
    fprintf(fileID_20_O,'%f\n',TempNaive4(i));
end


fileID_25_O = fopen('StepPlacement_25_O.txt','w');
fprintf(fileID_25_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt5)
    fprintf(fileID_25_O,'%d\t',i);
    fprintf(fileID_25_O,'%f\n',TempNaive5(i));
end


fileID_50_O = fopen('StepPlacement_50_O.txt','w');
fprintf(fileID_50_O,'Index\tLambda Value\n\n');
for i=1:length(TempOpt6)
    fprintf(fileID_50_O,'%d\t',i);
    fprintf(fileID_50_O,'%f\n',TempNaive6(i));
end

cd ..
