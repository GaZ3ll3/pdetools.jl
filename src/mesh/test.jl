include("Mesh.jl")

cell_type = "Triangle"
dim       = 2
n_v       = 9
n_f       = 8
n_e       = 8
n_c       = 1

face = [
1 4 2;
4 5 2;
5 3 2;
5 6 3;
7 5 4; 
7 8 5;
8 6 5;
8 9 6]

vertice = [
0. 1.;
.5 1.;
1. 1.;
0. .5;
.5 .5;
1. .5;
0. 0.;
.5 0.;
1. 0.;
]

mt = MeshTopology(cell_type, dim, n_v, n_f, n_e, n_c, face, vertice)

@time _orientation(mt)
