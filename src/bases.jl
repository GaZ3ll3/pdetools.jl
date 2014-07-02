function _linear_base_1(xi, eta)
	1 - xi - eta
end

function _linear_base_2(xi, eta)
	xi
end

function _linear_base_3(xi, eta)
	eta
end

function _dxi_linear_base_1(xi,eta)
	-1.0
end

function _deta_linear_base_1(xi,eta)
	-1.0
end

function _dxi_linear_base_2(xi, eta)
	1.0
end

function _deta_linear_base_2(xi,eta)
	0.0
end

function _dxi_linear_base_3(xi,eta)
	0.0
end

function _deta_linear_base_3(xi, eta)
	1.0
end

