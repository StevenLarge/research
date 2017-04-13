%This script calculates the Fisher information as a function of the
%parameters for a Bistable potential
%
%Steven Large
%September 14th 2016

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




