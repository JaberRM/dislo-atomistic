clear;
clc;
close all;
%% Inputs

FieldN = 5;

% a0 = 4.08; % Au
a0 = 4.0500; % Al
Elasticity;

Read_Dump;

DisN0 = 4;

Berg = a0 * sqrt(6)/6;
YCC = (121.591+123.93)/2  % best to be average Y value of two (111) planes

% I create each perfect dislocation as two close partial dislcoations (to
% prevent cross slip in case of screw

Dis0(1).XC = (Box(1,1) + Box(1,2) ) * 1/4 - a0;
Dis0(1).YC = YCC;
Dis0(1).ZC = (Box(3,1) + Box(3,2) ) / 2 * 0.999;
Dis0(1).BE = Berg * sin(pi/6) ;
Dis0(1).BS = Berg * cos(pi/6);

Dis0(2).XC = (Box(1,1) + Box(1,2) ) * 1/4 + a0;
Dis0(2).YC = YCC;
Dis0(2).ZC = (Box(3,1) + Box(3,2) ) / 2 * 0.999;
Dis0(2).BE = -Berg * sin(pi/6) ;
Dis0(2).BS = Berg * cos(pi/6);

Dis0(3).XC = (Box(1,1) + Box(1,2) ) * 3/4-a0;
Dis0(3).YC = YCC;
Dis0(3).ZC = (Box(3,1) + Box(3,2) ) / 2 * 0.999;
Dis0(3).BE = Berg * sin(pi/6) ;
Dis0(3).BS = -Berg * cos(pi/6);

Dis0(4).XC = (Box(1,1) + Box(1,2) ) * 3/4 + a0;
Dis0(4).YC = YCC;
Dis0(4).ZC = (Box(3,1) + Box(3,2) ) / 2 * 0.999;
Dis0(4).BE = -Berg * sin(pi/6) ;
Dis0(4).BS = -Berg * cos(pi/6);



PerImageN = 5;

%% Initialize
Ux=zeros(AtomN,1);
Uy=zeros(AtomN,1);
Uz=zeros(AtomN,1);


Lx = Box(1,2)-Box(1,1);
Ly = Box(2,2)-Box(2,1);
Lz = Box(3,2)-Box(3,1);

%% Add Periodic Dis. Images
DisN = 0;

for n1=-PerImageN:PerImageN
    for n2=-PerImageN:PerImageN
        for i=1:DisN0
            
            DisN=DisN+1;
            
            Dis(DisN).XC = Dis0(i).XC + n1 * Lx;
            Dis(DisN).YC = Dis0(i).YC + n2 * Ly;
            Dis(DisN).ZC = Dis0(i).ZC;
            Dis(DisN).BS = Dis0(i).BS;
            Dis(DisN).BE = Dis0(i).BE;
            
            
        end
        
    end
end



%% Calc

% Correct_Err_Edge;
Correct_Err;



for j=1:DisN
    
    [UxS , UyS, UzS] = Screw(Dis(j),P);
    [UxE , UyE, UzE] = Edge(Dis(j),P,nu);
    
    Ux = Ux + UxS + UxE;
    Uy = Uy + UyS + UyE;
    Uz = Uz + UzS + UzE;
    
    display(sprintf(' %d out of %d \n',j,DisN));
end

Ux = Ux - UerrX1* ( P(:,1) - Lx/2) - UerrX2 * ( P(:,2) - Ly/2);
Uy = Uy - UerrY1* ( P(:,1) - Lx/2) - UerrY2 * ( P(:,2) - Ly/2);
Uz = Uz - UerrZ1* ( P(:,1) - Lx/2) - UerrZ2 * ( P(:,2) - Ly/2);

X = P(:,1) + Ux;
Y = P(:,2) + Uy;
Z = P(:,3) + Uz;

Wrap_Periodic;


Write_Dump;


