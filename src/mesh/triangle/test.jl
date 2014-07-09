# include("call.jl")
include("triangulate.jl")

np = 4
na = 1
pl = [0., 0., 1., 0., 1., 10., 0., 10.]
pal = [0., 1., 11., 10.]
pml = [0, 2, 0, 0]
ns  = 0
nh  = 0
nr  = 1
rl = [0.5, 5.0, 7.0, 0.1]

# ret = ccall((:triangleio, "./libtriangle.so"), Any, (Ptr{Void}, Ptr{Uint8}, Ptr{Uint8}, Int64, Int64, Ptr{Float64}, Ptr{Float64},Ptr{Int64}, Int64, Int64, Int64, Ptr{Float64}),
#  (pointer_from_objref(TriangleIO)),"pczAevn","pra0.1zBP", np, na,  pl, pal, pml, ns, nh, nr, rl)

# println(ret.pointlist)



ret = TriangleIO.triangulate(0.1, np, na, pl, pal, pml, ns, nh, nr, rl)

println(ret.pointlist)
