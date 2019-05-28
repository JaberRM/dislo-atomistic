%% X
% 
% cnd = X > Box(1,2);
% X(cnd)=X(cnd) - Lx;
% 
% 
% cnd = X < Box(1,1);
% X(cnd)=X(cnd) + Lx;
% 
% 
% %% Y
% 
% cnd = Y > Box(2,2);
% Y(cnd)=Y(cnd) - Ly;
% 
% 
% cnd = Y < Box(2,1);
% Y(cnd)=Y(cnd) + Ly;
% 


%% Z
cnd = Z > Box(3,2);
Z(cnd)=Z(cnd) - Lz;


cnd = Z < Box(3,1);
Z(cnd)=Z(cnd) + Lz;
