

function _assembly_local(fe::FE, id::Int64,xi::Float64,eta::Float64, dn::Array{Float64, 2})
    _node_1::Int64 = fe.elements[id, 1]
    _node_2::Int64 = fe.elements[id, 2]
    _node_3::Int64 = fe.elements[id, 3]

    _x_1::Float64 = fe.coordinates[_node_1, 1]
    _y_1::Float64 = fe.coordinates[_node_1, 2]

    _x_2::Float64 = fe.coordinates[_node_2, 1]
    _y_2::Float64 = fe.coordinates[_node_2, 2]

    _x_3::Float64 = fe.coordinates[_node_3, 1]
    _y_3::Float64 = fe.coordinates[_node_3, 2]

    weighted_x::Float64 = 
                    _x_1*_linear_base_1(xi, eta) +
                    _x_2*_linear_base_2(xi, eta) +
                    _x_3*_linear_base_3(xi, eta)

    weighted_y::Float64 = 
                    _y_1*_linear_base_1(xi, eta) + 
                    _y_2*_linear_base_2(xi, eta) +
                    _y_3*_linear_base_3(xi, eta)


    _area::Float64  = (_x_1 - _x_3)*(_y_2 - _y_1) - (_x_1 - _x_2)*(_y_3 - _y_2)

    # counter clockwise
    # @test _area > 0

    _dxi_x::Float64  =  (_y_3 - _y_1) / _area
    _dxi_y::Float64  =  (_x_3 - _x_1) / _area

    _deta_x::Float64 =  (_y_2 - _y_1) / _area
    _deta_y::Float64 =  (_x_2 - _x_1) / _area

    _jac_11::Float64 = 
                _x_1*_dxi_linear_base_1(xi,eta) +
                _x_2*_dxi_linear_base_2(xi,eta) +
                _x_3*_dxi_linear_base_3(xi,eta) 

    _jac_12::Float64 = 
                _x_1*_deta_linear_base_1(xi,eta)+
                _x_2*_deta_linear_base_2(xi,eta)+
                _x_3*_deta_linear_base_3(xi,eta)

    _jac_21::Float64 = 
                _y_1*_dxi_linear_base_1(xi,eta) +
                _y_2*_dxi_linear_base_2(xi,eta) +
                _y_3*_dxi_linear_base_3(xi,eta)
    
    _jac_22::Float64 = 
                _y_1*_deta_linear_base_1(xi,eta)+
                _y_2*_deta_linear_base_2(xi,eta)+
                _y_3*_deta_linear_base_3(xi,eta)

    jac::Float64     = abs(_jac_11 * _jac_22 - _jac_12*_jac_21)

    dn[1,1] = _dxi_linear_base_1(xi, eta)*_dxi_x + _deta_linear_base_1(xi,eta)*_deta_x
    dn[1,2] = _dxi_linear_base_1(xi, eta)*_dxi_y + _deta_linear_base_1(xi,eta)*_deta_y

    dn[2,1] = _dxi_linear_base_2(xi, eta)*_dxi_x + _deta_linear_base_2(xi,eta)*_deta_x
    dn[2,2] = _dxi_linear_base_2(xi, eta)*_dxi_y + _deta_linear_base_2(xi,eta)*_deta_y

    dn[3,1] = _dxi_linear_base_3(xi, eta)*_dxi_x + _deta_linear_base_3(xi,eta)*_deta_x
    dn[3,2] = _dxi_linear_base_3(xi, eta)*_dxi_y + _deta_linear_base_3(xi,eta)*_deta_y

    return jac, weighted_x, weighted_y
end

function assembly_stima(fe::FE, U::Array{Float64,1}, stiff::Function, RHS::Function, F::Array{Float64,1})
    _nodal::Int64 = fe.np
    # triangular finite element
    _e_np::Int64   = 3
    _sp_max::Int64 = 20

    I::Array{Int64, 1}   = zeros(Int64, _sp_max*_nodal)
    J::Array{Int64, 1}   = zeros(Int64, _sp_max*_nodal)
    V::Array{Float64, 1} = zeros(Float64, _sp_max*_nodal)

    _weight::Array{Float64,1}   = zeros(Float64,3)
    _d_weight::Array{Float64,2} = zeros(Float64, 3, 2)

    _Ke::Array{Float64, 2} = zeros(Float64, _e_np, _e_np)

    _Fe::Array{Float64, 1} = zeros(Float64, _e_np)

    _sp_cnt::Int64   = 0


    for id = 1:fe.ne
        fill!(_Ke, .0)
        fill!(_Fe, .0)

        


    end







end
