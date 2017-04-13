#TimeDriver For local tests, calculating the total work only
#
#Steven Large
#January 18th 2017


from math import *
from Parameters import *
from LangevinPropogator import *
import random
import numpy as np

def FrictionPropogator(ProtocolTime):

	time = 0
	position = 0
	velocity = 0

	PositionTrack = []

	Equilibration = 500 							 			# Number of equilibration steps before taking running averages

	ProtocolTime = ProtocolTime + Equilibration

	while time < Equilibration:
		
		(time, position, velocity) = LangevinTrajectory(time, position, velocity)

	while time < ProtocolTime:

		(time, position, velocity) = LangevinTrajectory(time, position, velocity)
		PositionTrack.append(position)

	return PositionTrack 				








