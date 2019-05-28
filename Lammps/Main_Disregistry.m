clc;
clearvars;
% close all;

%%
BSize = [3,3];
FieldN = 6;

StepN = -1;  
StepN = 24;
StepN = 26;

L1 = '0 MPa';
L2 = '33.0 MPa';
L3 = '33.6 MPa';

Folder = 'Dis1';

a0 = 4.08; % Au
Berg1 = a0 * sqrt(2)/2;
Berg2 = a0 * sqrt(6)/6;

d = a0/sqrt(3);

if StepN>0 
    FileN = [Folder '/dump.' num2str(StepN)];
else
    FileN =[Folder '/dump.00'];
end

Read_Dump;

Data = zeros(AtomN,6);

for i=1:AtomN
    
    Data(i,1) = Atom(i,1)/d;
    Data(i,2) = Atom(i,2)/d;
    Data(i,3) = Atom(i,3)/d;
    
    Data(i,4) = Atom(i,4)/Berg2;
    Data(i,5) = Atom(i,5);
    Data(i,6) = Atom(i,6)/Berg1;
    
end

Data = sortrows(Data);

X = Data(:,1);
Ux = Data(:,4);
Uz = Data(:,6);

Xfit = min(X):0.01:max(X);

UxFit = fit(X,Ux,'smoothingspline','SmoothingParam',0.99999);
UxFit1 = feval(UxFit,Xfit);

UzFit = fit(X,Uz,'smoothingspline','SmoothingParam',0.99999);
UzFit1 = feval(UzFit,Xfit);

%%

Folder = 'Dis2';

if StepN>0 
    FileN = [Folder '/dump.' num2str(StepN)];
else
    FileN =[Folder '/dump.00'];
end

Read_Dump;

Data = zeros(AtomN,6);

for i=1:AtomN
    
    Data(i,1) = Atom(i,1)/d;
    Data(i,2) = Atom(i,2)/d;
    Data(i,3) = Atom(i,3)/d;
    
    Data(i,4) = Atom(i,4)/Berg2;
    Data(i,5) = Atom(i,5);
    Data(i,6) = Atom(i,6)/Berg1;
    
end

Data = sortrows(Data);

X =  Data(:,1);
Ux = Data(:,4);
Uz = Data(:,6);

UxFit = fit(X,Ux,'smoothingspline','SmoothingParam',0.99999);
UxFit2 = feval(UxFit,Xfit);

UzFit = fit(X,Uz,'smoothingspline','SmoothingParam',0.99999);
UzFit2 = feval(UzFit,Xfit);

%% Edge

figure(1);
hold on
DisX = UxFit2-UxFit1;
plot(Xfit,DisX)
h = xlabel('$x/d_{111}$'); set(h,'interpreter','latex')
h = ylabel('$u_x/b_{[\bar{1}\bar{1}2]}$'); set(h,'interpreter','latex')

%% Screw
[Value , ind] = max(Uz);

figure(2);
hold on
DisZ = UzFit2-UzFit1;
plot(Xfit,DisZ)
h = xlabel('$x/d_{111}$'); set(h,'interpreter','latex');
h= ylabel('$u_z/b_{[\bar{1}10]}$'); set(h,'interpreter','latex');

%%
Data = [Xfit' ,  DisX, DisZ];
save(['Disreg' num2str(StepN) '.txt'],'Data','-ASCII')

figure(1);
legend(L1,L2,L3);


figure(2);
legend(L1,L2,L3);







