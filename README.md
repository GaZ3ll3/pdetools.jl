PDEtools.jl
===

Early stage versions will focus on solving second order PDE in 2D/3D with finite element method, with classical Galerkin basis.

The solver will probably require bilinear form and have to apply Neumann boundary condition on the assembly matrices. Just like FreeFEM++ and Fenics style.

Meshing is not the main job of this program. Maybe Meshing method will need another repo. Right now, I am thinking of making a copy of initmesh from ``MATLAB@2013a``. And will also borrow some idea from distmesh package. System mesh gnerator for UnitSquare, Circle, UnitCube, Sphere will be considered.

Initial Idea:

A PDE problem is like

- Setup Mesh obj: 

  contain points, elements, boundaries information.

- Bilinear Form:

  Like 

  ```
  Int grad(u)*grad(v)dx == Int f*vdx - int g*vds 
  ```

  ``dx`` : integration in domain
  
  ``ds`` : integration on boundary
  
  ``g``  : Neumann/Robin condition is defined on all boundaries. But set it to be zero on Dirichlet boundries.
  
  ``f``  : force term on all points.
  
  All data have to be a ``Function`` type or ``Array{Number}`` type. If data is an array, then dimension needs to be matched on specific nodes.

- Assembly

  From bilinear form, build matrices for each side, i.e. LHS and RHS. Fast ``quad`` method will be considered to be first choice. Symbolic integration will be taken as a choice, but depends on how much effort worths.

- Apply Dirichlet condition.

- Solve ``Ax = b`` by using Lapack sparse methods. Gmres and Minres will be considered as a choice, if result is not good enough.

Feel free to post an issue to contribute your idea to this repo.



