


PCorner(1,1) =  Box(1,1);
PCorner(1,2) =  Box(2,1);
PCorner(1,3) =  Box(3,1);

PCorner(2,1) =  Box(1,2);
PCorner(2,2) =  Box(2,1);
PCorner(2,3) =  Box(3,1);

PCorner(3,1) =  Box(1,1);
PCorner(3,2) =  Box(2,2);
PCorner(3,3) =  Box(3,1);

UsumX1=0;
UsumY1=0;
UsumZ1=0;

UsumX2=0;
UsumY2=0;
UsumZ2=0;

UsumX3=0;
UsumY3=0;
UsumZ3=0;

for j=1:DisN
    [Ux0 , Uy0, Uz0] = Edge(Dis(j),PCorner(1,:),nu);
    UsumX1=UsumX1 + Ux0;
    UsumY1=UsumY1 + Uy0;
    UsumZ1=UsumZ1 + Uz0;
    
end


for j=1:DisN
    [Ux0 , Uy0, Uz0] = Edge(Dis(j),PCorner(2,:),nu);
    UsumX2=UsumX2 + Ux0;
    UsumY2=UsumY2 + Uy0;
    UsumZ2=UsumZ2 + Uz0;
    
end


for j=1:DisN
    [Ux0 , Uy0, Uz0] = Edge(Dis(j),PCorner(3,:),nu);
    UsumX3=UsumX3 + Ux0;
    UsumY3=UsumY3 + Uy0;
    UsumZ3=UsumZ3 + Uz0;
    
end


UerrXE1 = (UsumX2 - UsumX1) / Lx;

UerrXE2 = (UsumX3 - UsumX1) / Ly;




