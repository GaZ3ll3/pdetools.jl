module TriangleIO

type triangulateio32
  pointlist::Array{Int32,1}                                             
  pointattributelist::Array{Float32,1}                               
  pointmarkerlist::Array{Int32,1}                                      
  numberofpoints::Int32                                            
  numberofpointattributes::Int32                                   

  trianglelist::Array{Int32,1}                                           
  triangleattributelist::Array{Float32,1}                                   
  # trianglearealist::Array{Float32,1}                                     
  # neighborlist::Array{Int32,1}                                           
  numberoftriangles::Int32                                         
  numberofcorners::Int32                                           
  numberoftriangleattributes::Int32                                

  # segmentlist::Array{Int32,1}                                              
  # segmentmarkerlist::Array{Int32,1}                                        
  # numberofsegments::Int32                                          

  # holelist::Array{Int32,1}                        
  # numberofholes::Int32                     

  regionlist::Array{Float32,1}                      
  numberofregions::Int32                   

  edgelist::Array{Int32,1}                        
  # edgemarkerlist::Array{Int32,1}            
  # normlist::Array{Float32,1}               
  numberofedges::Int32  
end



type triangulateio64
  pointlist::Array{Int64,1}                                             
  pointattributelist::Array{Float64,1}                               
  pointmarkerlist::Array{Int64,1}                                      
  numberofpoints::Int64                                            
  numberofpointattributes::Int64                                   

  trianglelist::Array{Int64,1}                                           
  triangleattributelist::Array{Float64,1}                                   
  # trianglearealist::Array{Float64,1}                                     
  # neighborlist::Array{Int64,1}                                           
  numberoftriangles::Int64                                         
  numberofcorners::Int64                                           
  numberoftriangleattributes::Int64                                

  # segmentlist::Array{Int64,1}                                              
  # segmentmarkerlist::Array{Int64,1}                                        
  # numberofsegments::Int64                                          

  # holelist::Array{Int64,1}                        
  # numberofholes::Int64                     

  regionlist::Array{Float64,1}                      
  numberofregions::Int64                   

  edgelist::Array{Int64,1}                        
  # edgemarkerlist::Array{Int64,1}            
  # normlist::Array{Float64,1}               
  numberofedges::Int64  
end

function triangulate(
size::Float64,
numberofpoints::Int64,
numberofpointattributes::Int64,
pointlist::Array{Float64, 1},
pointattributelist::Array{Float64, 1},
pointmarkerlist::Array{Int64, 1},
numberofsegments::Int64,
numberofholes::Int64,
numberofregions::Int64,
regionlist::Array{Float64, 1})

ret = ccall((:triangleio, "./libtriangle.so"), Any, (Ptr{Void}, Ptr{Uint8}, Ptr{Uint8}, Int64, Int64, Ptr{Float64}, Ptr{Float64},Ptr{Int64}, Int64, Int64, Int64, Ptr{Float64}),
 (pointer_from_objref(TriangleIO)),"pczAevn",string("pra",size,"zBP"), numberofpoints, numberofpointattributes,  pointlist, pointattributelist, pointmarkerlist, numberofsegments, numberofholes, 
 numberofregions, regionlist)

return ret

end

end
