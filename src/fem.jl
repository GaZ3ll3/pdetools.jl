type FiniteElementSpace
	dimen::Int64
	nodal::Array{Float64 , 1}
	index::Array{Int64, 1}
	ninter:: Int64

	ndirichlet:: Int64
	# nneumann  :: Int64

	function FiniteElementSpace(mesh::Mesh, bc::Function)
		dimen::Int64 = mesh.dimen
		nnode::Int64 = mesh.nnode
		nodal::Array{Float64, 1} = zeros(Float64, nnode)
		index::Array{Float64, 1} = zeros(Int64  , nnode)

		nbd::Int64 = 0
		nid::Int64 = 0

		x::Float64 = .0
		y::Float64 = .0

	@inbounds for i = 1 : nnode
			x::Float64 = mesh.coord[i , 1]
			y::Float64 = mesh.coord[i , 2]

			if on_boundary(x, y)
				nbd     += 1
	@inbounds   nodal[i] = bc(x,y)
			else
				nid     += 1
	@inbounds   index[i] = nid 
			end
		end # end of for

		ninter::Int64 = nnode - nbd

		new (dimen, nodal, index, ninter, nbd)

	end # end of function

end # end of type