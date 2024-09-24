#!/usr/bin/python3

### Gaussian Convolution for density of state
import scipy.ndimage as nd
import numpy as np
import matplotlib.pyplot as plt
import sys


# Initial parameters
# Input
file=sys.argv[1]
sigma=sys.argv[3]
sigma=float(sigma)


# For non-spin polarize case
data=np.loadtxt(file)
conv =np.array(nd.gaussian_filter1d(data[:,1],sigma))
newdata=np.insert(data,2,conv.T, axis=1)
np.savetxt(file+"-conv",newdata)

plt.plot(newdata[:,0],newdata[:,1],color="lightsalmon")
plt.plot(newdata[:,0],newdata[:,2],color="black")
plt.show()


