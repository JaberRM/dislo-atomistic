function [Ux , Uy, Uz] = Edge(Dis, P, nu)


X = P(:,1);
Y = P(:,2);
Z = P(:,3);

dX = X - Dis.XC;
dY = Y - Dis.YC;
dZ = Z - Dis.ZC;


% Ux = Dis.B / (2 * pi) * atan2(dY,dX);
% Uy = 0;
% Uz = 0;

Ux =  Dis.BE / (2 * pi) * ( atan2(dY,dX) + dX .* dY ./ ( 2*(1-nu) * (dX.^2 + dY.^2 + 1E-20) ) );
Uy = -Dis.BE / (2 * pi) * ( (1-2*nu) / (4*(1-nu)) * log(dX.^2+dY.^2+1E-20)   + (dX.^2 - dY.^2) ./ ( 4*(1-nu) * (dX.^2 + dY.^2 + 1E-20) ) );
Uz = 0;


end