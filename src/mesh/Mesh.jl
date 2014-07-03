type MeshTopology
    _cell_type   ::ASCIIString
    _num_dim     ::Int64
    _num_vertices::Int64
    _num_faces   ::Int64
    _num_edges   ::Int64
    _num_connection::Int64

    face_mapping ::Array{Int64, 2}
    vertice_mapping:: Array{Float64, 2}

    function MeshTopology(
        _cell_type::ASCIIString,
        _num_dim  ::Int64,
        _num_vertices :: Int64,
        _num_faces :: Int64,
        _num_edges :: Int64,
        _num_connection :: Int64,
        face_mapping :: Array{Int64, 2},
        vertice_mapping :: Array{Float64, 2})
        return new(
        _cell_type,
        _num_dim,
        _num_vertices,
        _num_faces,
        _num_edges,
        _num_connection,
        face_mapping,
        vertice_mapping)
    end
end

################################################

################################################

################################################
#
#_mesh_builder generates mesh topology from 
# boundary (shape) function
#
################################################
function _mesh_builder(on_boundary::Function)

    for 

end



################################################
#
# _orientation detects if all faces are oriented
#
#
################################################
function _orientation(mt::MeshTopology)
    oriented::Bool = true
    _x_1::Float64 = .0
    _y_1::Float64 = .0
    _x_2::Float64 = .0
    _y_2::Float64 = .0
    _x_3::Float64 = .0
    _y_3::Float64 = .0
    if mt._cell_type == "Triangle"
        for i = 1 : mt._num_faces
            _x_1 = mt.vertice_mapping[mt.face_mapping[i, 1], 1]
            _y_1 = mt.vertice_mapping[mt.face_mapping[i, 1], 2]
            _x_2 = mt.vertice_mapping[mt.face_mapping[i, 2], 1]
            _y_2 = mt.vertice_mapping[mt.face_mapping[i, 2], 2]
            _x_3 = mt.vertice_mapping[mt.face_mapping[i, 3], 1]
            _y_3 = mt.vertice_mapping[mt.face_mapping[i, 3], 2]
            if (_x_2 - _x_1)*(_y_3 - _y_1) - (_x_3 - _x_1)*(_y_2 - _y_1) <= 0
                oriented = false
                return oriented
            end
        end
        return oriented
    end 
end


#########################################
type Mesh
    _topology::MeshTopology

end
#########################################
function num_vertices(mesh::Mesh)

end
#########################################
