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

function pdeigeom(dl,bs,s)
	nbs = size(dl,2)
	d = [zeros(1,nbs);
		ones(1,nbs);
		dl[6:7,:]]

	bst = bs[:]' # flatten

	if length(find(x->(x<1)|(x>nbs),bst))!=0
		error("pde:pdeigeom:InvalidBs")
	end	
	
	x = zeros(size(s))
	y = zeros(size(s))

	(m,n) = size(bs);
	if m==1 & n==1
		bs = bs*ones(size(s))
	elseif m!=size(s,1) | n!=size(s,2)
		error("pde:pdeigeom:SizeBs")
	end
end

function pdeigeom(dl)
	nbs = size(dl,2)
	return nbs
end

function pdeigeom(dl,bs)
	nbs = size(dl,2)
	d = [zeros(1,nbs);
		ones(1,nbs);
		dl[6:7,:]]

	bst = bs[:]' # flatten

	if length(find(x->(x<1)|(x>nbs),bst))!=0
		error("pde:pdeigeom:InvalidBs")
	end	

	return d[:,bst[:]]
end

function pdemgeom(G,Hmax)
	nbs = pdeigeom(G)
	d = pdeigeom(G,1:nbs)
end




prop = Property()
show(STDOUT,prop)



geom = [2 0 1 0 0 1 0;
        2 1 1 0 1 1 0;
        2 1 0 1 1 1 0;
        2 0 0 1 0 1 0]';

pdemgeom(geom,0.5)