type Property
	Hmax::Float64
	Hgrad::Float64
	Box::Bool
	Init::Bool
	Jiggle::ASCIIString
	JiggleIter::Int64

	function Property()
		return new(0.0,1.3,false,false,"mean",-1)
	end
end


function show(io::IO, prop::Property)
	print(io,"Property:\n")
	print(io,"\tHmax : $(prop.Hmax)\n")
	print(io,"\tHgrad : $(prop.Hgrad)\n")
	print(io,"\tBox : $(prop.Box)\n")
	print(io,"\tInit: $(prop.Init)\n")
	print(io,"\tJiggle : $(prop.Jiggle)\n")
	print(io,"\tJiggleIter : $(prop.JiggleIter)\n")
end

#input G as geometry matrix.

function initmesh(G)
	# set default
	prop = Property(.0,1.3,false,false,"mean",-1)

end

prop = Property()
show(STDOUT,prop)
