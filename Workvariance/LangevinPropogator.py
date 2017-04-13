#Thie module contains the Langevin propogator routines for the work variance calculations
#
#Steven Large
#January 17th 2017

from math import *
import random
from Parameters import *

#This is the langevin dynamics algorithm from the paper:  D.A. Sivak, J.D. Chodera, and G.E. Crooks, 
#'Time-step rescaling recovers continuous-time dynamical properties for dicrete time langevin integration of nonequilibrium systems'
# J. Phys. Chem. B.
# 2014, 118, 24

def Langevin(time,position,velocity,CP,CPVelocity): 	#This is for the simulations where the control parameter is moving

	velocity = sqrt(a)*velocity+sqrt((1-a)/(beta*m))*random.gauss(0,1) 
	velocity = velocity+0.5*dt*ForceParticle(position,CP)/m
	position = position+0.5*dt*velocity
		
	CPOld = CP 								#CP is the control parameter, which is the minima of the harmonic trap

	time += dt

	CP = CPOld + CPVelocity*dt

	Work = WorkCalc(position,CP,CPOld)		#Calculate work associated with changing CP

	position = position+0.5*dt*velocity 
	velocity = velocity+0.5*dt*ForceParticle(position,CP)/m
	velocity = sqrt(a)*velocity+sqrt((1-a)/(beta*m))*random.gauss(0,1)

	return time, position, velocity, Work, CP

def LangevinTrajectory(time, position, velocity):		#This is for simulations where the control parameter is fixed (i.e. to calculate frictions)

	velocity = sqrt(a)*velocity+sqrt((1-a)/(beta*m))*random.gauss(0,1) 
	velocity = velocity+0.5*dt*ForceParticle(position,0)/m
	position = position+0.5*dt*velocity

	time += dt

	position = position+0.5*dt*velocity 
	velocity = velocity+0.5*dt*ForceParticle(position,0)/m
	velocity = sqrt(a)*velocity+sqrt((1-a)/(beta*m))*random.gauss(0,1)

	return time, position, velocity



def ForceParticle(position,CP):

	F = -k*(position - CP)

	return F


def WorkCalc(position, CP, CPOld):

	E1 = 0.5*k*((position - CPOld)**2)
	E2 = 0.5*k*((position - CP)**2)

	dE = E2 - E1

	return dE
