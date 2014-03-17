include("types.jl")

# read files to load finite elements


# example
elements = [1 3 4; 1 2 3]
coordinates = [0 0; 1 0; 1 1; 0 1]

dirichlet = [1 2;2 3]
neumann = [3 4;4 1]

bc = BC(dirichlet,neumann)
fem = FE(elements,float(coordinates),bc)


femm = FE(2,4,4,elements,float(coordinates),bc)

FECheck(fem)
FECheck(femm)
# show(STDOUT,fem)
# show(STDOUT,femm)

(M,K) = stima(fem)

@test_approx_eq_eps det(full(K)) 0 1e-16
@test_approx_eq_eps det(full(M)) 0 1e-4

f = x->0
g = x->x[1]

b = assembly_f(fem,f)

u = spzeros(fem.np,1)

fixed = unique(fem.boundary.dirichlet)

c = fem.coordinates[fixed,:]

# devec
for j in fixed
	u[j] = g(fem.coordinates[j,:])
end

b = b - K*u

free = setdiff(1:fem.np,fixed)

full(u)[free] = M[free,free]\b[free]

@test all(u.==[0 1 1 0]')
