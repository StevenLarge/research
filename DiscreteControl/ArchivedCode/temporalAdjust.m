%This script calculates a new allocation of time values consistent with the
%required constraint on the fixed total time.
%
%Steven Large
%October 5th 2016

function[TimeAllocNew] = temporalAdjust(TimeAlloc)

LR = 10;                                                                        %This is essentially a learning rate, determines how large the average increases in time allocation are

PickImplementation = round(rand(1,length(TimeAlloc)));                          %Picks random allocations to change

Alteration = zeros(1,length(PickImplementation));

for k=1:length(PickImplementation)

    Alteration(k) = round(PickImplementation(k)*LR*randn(1));

    TimeAlloc(k) = TimeAlloc(k) + Alteration(k);
    
end

TotalChange = sum(Alteration);

PickImplementation2 = PickImplementation - 1;

UniformAdjust = TotalChange/(sum(PickImplementation2));

for k=1:length(PickImplementation)
    
    TimeAlloc(k) = TimeAlloc(k) + PickImplementation2(k)*UniformAdjust;     %Ensures that the total sum of times is unchanged
    
end

TimeAllocNew = TimeAlloc;



