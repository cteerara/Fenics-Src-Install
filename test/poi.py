"""
FEniCS tutorial demo program: Poisson equation with Dirichlet conditions.
Test problem is chosen to give an exact solution at all nodes of the mesh.
  -Laplace(u) = f    in the unit square
            u = u_D  on the boundary
  u_D = 1 + x^2 + 2y^2
    f = -6
"""

from __future__ import print_function
from fenics import *
import time
import sys
import os

def boundary(x, on_boundary):
    return on_boundary

# Create mesh and define function space
comm = MPI.comm_world
numprocs = MPI.size(comm)
rank = MPI.rank(comm)
time_start = time.time()
N = 1000
mesh = UnitSquareMesh(N,N)
V = FunctionSpace(mesh, 'P', 1)

# Define boundary condition
u_D = Expression('2 + x[0]*x[0] + 2*x[1]*x[1]', degree=2)


bc = DirichletBC(V, u_D, boundary)

# Define variational problem
u = TrialFunction(V)
v = TestFunction(V)
f = Constant(-6.0)
a = dot(grad(u), grad(v))*dx
L = f*v*dx

# Compute solution
u = Function(V)
#solve(a == L, u, bc, solver_parameters={'linear_solver': sys.argv[1]})
problem = LinearVariationalProblem(a, L, u, bc)
solver = LinearVariationalSolver(problem)
solver.parameters["krylov_solver"]["relative_tolerance"] = 1e-4
#solver.parameters["krylov_solver"]["monitor_convergence"] = True
solver.solve()
if rank == 0:
    print("Total Time elapsed %s\n" %(time.time()-time_start))


outpath = 'test_output_'+ str(numprocs) +'procs/test.pvd'
output_file = File(outpath)
output_file << u



