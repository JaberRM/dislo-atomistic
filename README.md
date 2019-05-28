# dislo-atomistic  
This is a collection of scripts and codes to create and simulate straight edge, screw or mixed dislocations in fcc lattice.  
Dislocation core relaxation, dissociation, direct Peierls stress calculation and disregistry calculation can be performed with the provided scripts. 

# Requirements
Lammps (https://lammps.sandia.gov/)  
Matlab (Octave may work as well)  
Ovito (optional, for visulizations & post-processing) (https://ovito.org/)    

# How to use
1) Modify & run `./Lammps/inAl.Fcc` (with Lammps) to get the initial fcc structure. This will generate `./Lammps/dump_Fcc.out` file.  
2) Open `dump_Fcc.out` in Ovito (or any visualuzation software), check the periodic boundaries and quality of the initial structure. Find out the desired dislocation plane (glide plane normal always in y). It is best to take average position of two (111) atomic planes as the dislocation glide plane.  
3) Modify Main.m to set the number of dislocations, their Burgers vectors (dislocation line is always along z). Run Main.m with matlab (or Octave). This will create `./Lammps/dump_Dis.out`  
4) Open `./Lammps/dump_Dis.out` in Ovito, verify the dislocation and periodic boundary conditions using Common Negibor Analysis (CNA) and dislocation analysis (DXA).  
5) Modify `./Lammps/inAlMS.Dis` and run with Lammps for Peierls stress calculation
