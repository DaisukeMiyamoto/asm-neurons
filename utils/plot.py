import matplotlib
matplotlib.use('Agg')
import numpy as np
import matplotlib.pyplot as plt
import sys

argvs = sys.argv
argc = len(argvs)

if argc < 3:
    print 'Usage: ./%s [input_filename] [output_filename]' % (argvs[0])
    quit()

in_datafile = argvs[1]
out_imagefile = argvs[2]

title = ''
if len(argvs) > 3:
    title = argvs[3]

data = np.loadtxt(in_datafile)

t = data[:,0]
v = data[:,1]

plt.title(title)
plt.xlabel("t [msec]")
plt.ylabel("Membrane Potential [mV]")
plt.ylim([-80,40])
plt.plot(t, v)
plt.savefig(out_imagefile)
