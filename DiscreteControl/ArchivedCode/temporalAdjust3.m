%This scipt calcualtes new temporal allotments based on a random slection
%of a subset of the steps
%
%Steven Large
%October 7th 2016

function[NewTimeAlloc,TotalTime] = temporalAdjust3(TimeAlloc)

Choice = round(rand(1,length(TimeAlloc)));                               %Picks random allocations to change

%This is not needed in this case as there is a 'particle-hole symmetry'
%PlusMinus = 2*(round(rand(1,1)) - 0.5);                                              %Randomly choose whether the increment is positive or negative

for index=1:length(Choice)                                               %Adjusts the random positions picked for time adjustment (this adds time to the chosen positions)

    TimeAlloc(index) = TimeAlloc(index) + Choice(index);  

end

Total = sum(Choice);

for index2=1:Total                                                       %This loop will randomly subtract 1 from the same number of elements that were incremented up in the first readjustment step, ensuring constant total time 
    
    RandomIndex = round(length(TimeAlloc)*rand(1,1) + 0.5);
    
    TimeAlloc(RandomIndex) = TimeAlloc(RandomIndex) - 1;
    
end

NewTimeAlloc = TimeAlloc;

TotalTime = sum(NewTimeAlloc);

