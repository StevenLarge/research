%This script calculates the Cost function for an input of the ACF, the Delta
%Lambda terms and the time allocation
%
%Steven Large
%October 5th 2016

function[J] = CalculateCost(ACF,DeltaLambda,TimeAlloc)

Cost = 0;

for k=1:length(ACF)

   DeltaLambda{1};
    
   DeltaLambda{1}(k+1)*DeltaLambda{1}(k);
   
   ACF{k}(ceil(TimeAlloc(k)));
   
   Cost = Cost + DeltaLambda{1}(k+1)*DeltaLambda{1}(k)*ACF{k}(round(TimeAlloc(k))); 
    
end

J = Cost;


