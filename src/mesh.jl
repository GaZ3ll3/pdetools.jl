using Base.Test

type Mesh
	dimen :: Int64
	nelem :: Int64
	nnode :: Int64

	coord :: Array{Float64, 2}
	tmesh  :: Array{Int64, 2}

	Mesh(dimen::Int32, nelem::Int64, nnode::Int64, coord::Array{Float64, 2},tmesh::Array{Float64, 2}) 
	= new(dimen, nelem, nnode, coord, tmesh)
end





