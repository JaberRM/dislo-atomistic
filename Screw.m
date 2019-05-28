function [Ux , Uy, Uz] = Screw(Dis, P)


dX = P(:,1) - Dis.XC;
dY = P(:,2) - Dis.YC;
dZ = P(:,3) - Dis.ZC;


Ux = 0;
Uy = 0;
Uz = Dis.BS / (2 * pi) * atan2(dY,dX);


end