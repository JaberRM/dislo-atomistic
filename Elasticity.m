
% E  = 1 ; % Young modulus (Pa) Cu
% nu = 0.3; % Poisson ratio

% % % conversion to Lame'
% mu = (1-2*nu)*E / ( 2*(1+nu)*(1-2*nu) );

% %% test Iso
% 
% mu = 100;
% nu = 0.285;


% %% Cu Iso

% mu = 48E9;
% nu = 0.3;
% 
% 
% % Al Iso
% mu = 26.5E9;
% nu = 0.347;
% 
% %%
% % % cubic elasticity
% landa = 2 * mu * nu / (1-2*nu);
% C1111 = (2*mu + landa);
% C1122 = landa;
% C1212 = mu;


%% Al Aniso

% C1111 = 113.8E9;   % Pa C11
% C1122 = 61.5E9;    % Pa C12
% C1212 =  31.6E9;   % Pa C44

% %% Cu Aniso
% 
%  C1111 = 169.9E9 ;   % Pa C11
%  C1122 = 122.6E9;    % Pa C12
%  C1212 =  76.2E9;   % Pa C44
 
%% Au Aniso
% 
 C1111 = 201.65E9 ;   % Pa C11
 C1122 = 169.53E9;    % Pa C12
 C1212 =  45.97E9;   % Pa C44

%%
% 
Bv = (C1111 + 2 * C1122) / 3;
Gv = (3*C1212 + C1111 - C1122)/5;
EY = 9*Bv*Gv / (3*Bv + Gv);
nu = 0.5 * (1-EY/(3*Bv));


mu = (1-2*nu)*EY / ( 2*(1+nu)*(1-2*nu) );

% E_Test = ((C1111 + 2*C1122)*(C1111 - C1122 + 3*C1212))/(2*C1111 + 3*C1122 + C1212)
% mu_Test = C1111/5 - C1122/5 + (3*C1212)/5

%%
C1111 = C1111 / mu;   % Pa C11
C1122 = C1122 / mu;    % Pa C12
C1212 =  C1212 / mu;   % Pa C44

%%
C=[ C1111    C1122   C1122   0          0         0;
    C1122    C1111   C1122   0          0         0;
    C1122    C1122   C1111   0          0         0;
    0        0       0       2*C1212    0         0;
    0        0       0       0          2*C1212   0;
    0        0       0       0          0         2*C1212];

% 
mu = mu / mu;




