#This is the primary module for calculating the friction in Time Separation Simualtions
#
#Steven Large
#January 23th 2017

import TimeDriverLocal
from Parameters import *
import WriteData
import FrictionCalculation
import os
import matplotlib.pyplot as plt

SampleTime = 100000 						#Total time of the simulated dynamics (in seconds)

CorrPath = 'AutoCorrelation/' 				#Path for writing the correlation functions to file

filename_Zeta = 'Zeta.dat' 					#File names of the autocorrelations for the generalized friction (zeta) and the new metric (Theta)
filename_Theta = 'Theta.dat'

PositionTrack = TimeDriverLocal.FrictionPropogator(SampleTime) 					#Generate an array tracking the particle position over the 'SampleTime'

Zeta,ZetaCorr,Theta,ThetaCorr = FrictionCalculation.Primary(PositionTrack)		#Calculate the autocorrelations and their integrals

ZetaName = os.path.join(CorrPath,'Zeta.dat') 			#Add the write path to the file names
ThetaName = os.path.join(CorrPath,'Theta.dat')

file1 = open(ZetaName,'w')								#Write the correlation data to file
file1.write('Friction\n\n')
file1.write('%lf\n' % Zeta)
file1.close()

file2 = open(ThetaName,'w')
file2.write('Theta\n\n')
file2.write('%lf\n' % Theta)
file2.close()

Plot1 = plt.plot(ZetaCorr,label='Zeta') 				#This plots the two correlation functions, and can be commented out if need be
Plot2 = plt.plot(ThetaCorr,label='Theta')
plt.legend()
plt.xlabel('Lag Time')
plt.ylabel('AutoCorrelation')
plt.title('Comparison of autocorrelation for Theta and Zeta Frictions')
plt.savefig('Autocorrelation_Compare.png')
plt.show()
plt.close()



