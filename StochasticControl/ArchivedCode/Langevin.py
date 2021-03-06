#This module contains the Langevin integrator algorithm
#
#Steven Large
#June 21st 2016

from math import *
from Potential import *
from Parameters import *

def LangevinCP(time, CPVel, sigma, CP, CPVelD):

	Min = time*CPVelD

	Init = CP

	CPVel = sqrt(a)*CPVel+sqrt((1-a)/(beta*m))*random.gauss(0,sigma) 
	CPVel = CPVel+0.5*dt*ForceOUCP(CP,Min)/m
	CP = CP+0.5*dt*CPVel
		
	time += dt

	Min = time*CPVelD

	CP = CP+0.5*dt*CPVel 

	CPVel = CPVel+0.5*dt*ForceOUCP(CP,Min)/m
	CPVel = sqrt(a)*CPVel+sqrt((1-a)/(beta*m))*random.gauss(0,sigma)

	Deter = dt*CPVelD

	Stoch = (CP - Init) - Deter

	return CP, Stoch


def Langevin(time, position, velocity, CP, sigma, CPVel): 									#Uses equation 3 in Phys.Rev.X. 3, 2013, Sivak et al. 

	velocity1 = sqrt(a)*velocity+sqrt((1-a)/(beta*m))*random.gauss(0,1) 
	
	velocity = velocity1 + 0.5*dt*ForceOU(position,CP)/m
							
	DeltaV = velocity - velocity1;
							
	Force = ForceOU(position,CP);
													
	StepWork = DeterministicWorkOU(position, time, CPVelD) 		 							#Calculate the deterministic contribution to the work

	position = position+0.5*dt*velocity
		
	time += dt

	CP, CPFluct = LangevinCP(time, CPVel, sigma, CP, CPVelD) 								#Langevin update to control parameter position

	position = position+0.5*dt*velocity

	StochasticWork1 = StochasticWorkOU2(Force,velocity);									#Calculate stochastic contribution to work value, subtracting off the deterministic motion
																
	velocity = velocity+0.5*dt*ForceOU(position,CP)/m
	velocity = sqrt(a)*velocity+sqrt((1-a)/(beta*m))*random.gauss(0,1)
	
	return time, position, velocity, StepWork, StochasticWork1, StochasticWork2, CP 			


