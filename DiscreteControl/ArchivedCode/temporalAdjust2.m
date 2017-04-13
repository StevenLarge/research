%This script calculates the new temporal alotments based on a single
%perturbation approach
%
%Steven Large
%October 7th 2016


function[NewTimeAlloc] = temporalAdjust2(TimeAlloc)

Choice = round((length(TimeAlloc))*rand(1,1) + 0.5);                               %This chooses a random index of the time allocation (uniformly)

PlusMinus = 2*(round(rand(1,1)) - 0.5);                                              %Randomly choose whether the increment is positive or negative

TimeAlloc(Choice) = TimeAlloc(Choice) - PlusMinus*(length(TimeAlloc)-1);             %Adjust the specified time allocation coordinate

for k=1:length(TimeAlloc)
    
    if k ~= Choice     
        TimeAlloc(k) = TimeAlloc(k) + PlusMinus;                                     %Readjust teh remaining to ensure constant total time
    end

end


NewTimeAlloc = TimeAlloc;