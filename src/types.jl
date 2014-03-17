using Base.Test,Base.det,Base.LinAlg.det

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

function show(io::IO,fe::FE)
	# println(io,fe.elements)
	# println(io,fe.coordinates)
	# println(io,fe.boundary.dirichlet)
	# println(io,fe.boundary.neumann)
end

# STIffness and MAss matrces
function stima(fe::FE)
	M = spzeros(fe.np,fe.np)
	K = spzeros(fe.np,fe.np)

	for j::Int64 = 1:fe.ne
		nodes = fe.coordinates[fe.elements[j,:][:],:]
		G = [ones(1,3);nodes']\[zeros(1,2);eye(2)];
		@assert det([ones(1,3);nodes'])>=0
		Ke = det([ones(1,3);nodes'])*G*G'/2;
		Me = det([ones(1,3);nodes'])/24*[2 1 1;1 2 1;1 1 2];
		K[fe.elements[j,:][:],fe.elements[j,:][:]] += Ke
		M[fe.elements[j,:][:],fe.elements[j,:][:]] += Me
	end
	return (M,K)
end

function assembly_f(fe::FE,Fforce::Function)
	b = zeros(fe.np,1)
	for j::Int64 = 1:fe.ne
		be = det([ones(1,3);
			fe.coordinates[fe.elements[j,:][:],:]'])*Fforce(
			sum(fe.coordinates[fe.elements[j,:][:],:],1)/3
			)/6;
		b[fe.elements[j,:][:]] .+= be
	end
	return b
end

function assembly_f(fe::FE,Fforce::Array{Float64,2})
end

# apply Neumann to force term
function assembly_n(fe::FE,b,FNeumann::Function)
end

function assembly_n(fe::FE,b,FNeumann::Array{Float64,1})
end

# b has been changed, now apply Dirichlet
function solver(fe::FE,A, b,FDirichlet::Function)
end

function solver(fe::FE,A,b, FDirichlet::Array{Float64,1})
end