using Base.Test

export FECheck

type BC
	dirichlet::Array{Int64,2}
	neumann::Array{Int64,2}
	function BC(dirichlet::Array{Int64,2},neumann::Array{Int64,2})
		return new(dirichlet,neumann)
	end
end

type FE
	ne::Int64
	np::Int64
	nb::Int64
	elements::Array{Int64,2}
	coordinates::Array{Float64,2}
	boundary::BC
	function FE(elements::Array{Int64,2},coordinates::Array{Float64,2},boundary::BC)
		return new(size(elements,1), size(coordinates,1),
			size(boundary.dirichlet,1) + size(boundary.neumann,1),
			elements,coordinates,boundary)
	end

	function FE(ne::Int64,np::Int64,nb::Int64,elements::Array{Int64,2},coordinates::Array{Float64,2},boundary::BC)
		return new(ne,np,nb,
			elements,coordinates,boundary)
	end
end

# EXPERIMENTAL

function FECheck(fe::FE)
		@test fe.ne==size(fe.elements,1)
		@test fe.np==size(fe.coordinates,1)
		@test fe.nb==size(fe.boundary.dirichlet,1) + size(fe.boundary.neumann,1)
end

