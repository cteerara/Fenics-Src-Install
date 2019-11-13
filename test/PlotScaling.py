import matplotlib.pyplot as plt
nproc = [1,6,12]
time = []
ideal = [1., 1./6., 1./12.]
def norm(arr):
    norm_arr = []
    for i in range(0,len(arr)):
        norm_arr.append(arr[i]/arr[0])
    return norm_arr

for i in range(0,len(nproc)):
    fname = "p"+str(nproc[i])+".out"
    fid = open(fname)
    lines = fid.readlines()
    for j in range(0,len(lines)):
        line = lines[j]
        if (line.split(" ")[0] == 'Total'):
            break;
    time.append(float(line.split(" ")[3]))
    fid.close()

plt.title("poisson solver - cg solver")
plt.loglog(nproc, norm(ideal), 'k-', basex=2, basey=2)
plt.loglog(nproc, norm(time), 'b.-', basex=2, basey=2)
plt.xlabel("number of processes")
plt.ylabel("t/t(nproc=2)")
plt.grid(True)
plt.savefig("scaling.png")
