#Plotting script for workvariance calcuations
#
#Steven Large
#January 17th 2017

import matplotlib.pyplot as plt

filename = 'WorkVariance.dat'
filename2 = 'AvgWork.dat'

file1 = open(filename,'r')
file2 = open(filename2,'r')

data = file1.readlines()
data2 = file2.readlines()

file1.close()
file2.close()

TimeVar = []
WorkVar = []
TimeAvg = []
WorkAvg = []

for index in range(len(data)-2):

	parsed = data[index+2].split()
	parsed2 = data2[index+2].split()

	TimeVar.append(eval(parsed[0]))
	WorkVar.append(eval(parsed[1]))
	TimeAvg.append(eval(parsed2[0]))
	WorkAvg.append(eval(parsed2[1]))

plt.plot(TimeVar,WorkVar,'r')
plt.plot(TimeAvg,WorkAvg,'b')
plt.show()
plt.close()

