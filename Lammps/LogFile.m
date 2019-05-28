clc
clear
% close all

%%%%%%%%

NFields=10;
Start_BL=6;

%%%%%%%%

fid = fopen('log.lammps', 'r+');

i=0;
flag=1;


NL=0;
BLN=0;
while ~feof(fid)
    
    A=fgetl(fid);
    NL=NL+1;
    [m n]=size(A);
    
    if n>=43
        if strcmp(A(1:43),'Step Temp Pxx Pyy Pzz Pxy Pxz Pyz Yz PotEng')==1
            BLN=BLN+1;
            Block(BLN).Start=NL+2;
        end
    end
    
    
    if n>12
        if strcmp(A(1:13),'Loop time of ')==1
            
            Block(BLN).end=NL-1;
        end
    end
    
    
end

number_Data=0;

for i=Start_BL:BLN
    number_Data=number_Data+Block(i).end-Block(i).Start+1;
end

Data1=zeros(number_Data,NFields);


frewind(fid);
BL=1;
i=0;
k=0;


while ~feof(fid)
    
    i=i+1;
    
    if BL>BLN
        break;
    end
    
    if i==Block(BL).Start
        Ndata=Block(BL).end-Block(BL).Start+1;
        
        for j=1:Ndata
            k=k+1;
            if BL>Start_BL
                
                Data1(k,1:NFields) = fscanf(fid,'%f',[1,NFields]);
            end
            fgetl(fid);
        end
        
        BL = BL+1
        
        i=i+Ndata-1;
        
    else
        fgetl(fid);
    end
    
    
    
    
end



fclose(fid);

[m,n]=size(Data1);


m=m-4;
Time=Data1(1:m,1) * 0.002;
Temp=Data1(1:m,2);


%Stress
Px=Data1(1:m,3)*0.1;
Py=Data1(1:m,4)*0.1;
Pz=Data1(1:m,5)*0.1;

Pxy=Data1(1:m,6)*0.1;
Pxz=Data1(1:m,7)*0.1;
Pyz=Data1(1:m,8)*0.1;


figure;

% set(Fig1,'color','w');
% set(axes,'FontSize',18,'FontWeight','bold');

hold on;
% grid on

plot(Time,-Px,'-','color','b');
plot(Time,-Py,'-','color','r');
plot(Time,-Px,'-','color','g');

plot(Time,-Pxy,'--','color','b');
plot(Time,-Pyz,'--','color','r');
plot(Time,-Pxz,'--','color','g');



plot(Time,Temp/100,'color','k');



hleg = legend('Txx','Tyy','Tzz','Txy','Tyz','Txz', 'Temp.');

% set(hleg,'FontSize',16,'FontWeight','bold');

% xlabel('Step','fontsize',18,'fontweight','b');
% ylabel('Stress (bar)','fontsize',18,'fontweight','b');

xlabel('Time (ps)');
ylabel('Stress (MPa)');

% Strain



% Xlo=Data1(1:m,9);
% Xhi=Data1(1:m,10);
%
% Ylo=Data1(1:m,11);
% Yhi=Data1(1:m,12);
%
% Zlo=Data1(1:m,13);
% Zhi=Data1(1:m,14);
%
%
% XY=Data1(1:m,15);
% XZ=Data1(1:m,16);
% YZ=Data1(1:m,17);
%
% LX0=Xhi(Relax_N)-Xlo(Relax_N);
% LY0=Yhi(Relax_N)-Ylo(Relax_N);
% LZ0=Zhi(Relax_N)-Zlo(Relax_N);
% XY0=XY(Relax_N);
% XZ0=XZ(Relax_N);
% YZ0=YZ(Relax_N);
%
% Exx=(Xhi-Zlo-LX0)/LX0;
% Eyy=(Yhi-Ylo-LY0)/LY0;
% Ezz=(Zhi-Zlo-LZ0)/LZ0;
%
% Exy=(XY-XY0)/LY0;
% Exz=(XZ-XZ0)/LZ0;
% Eyz=(YZ-YZ0)/LZ0;
%
%
%
% Fig2=figure;
% set(Fig2,'color','w');
% set(axes,'FontSize',18,'FontWeight','bold');
%
%
% hold on;
% grid on
% plot(Step,Exy,'color','b');
% plot(Step,Eyz,'color','r');
% plot(Step,Exz,'color','g');
%
% plot(Step,Exx,'--','color','b');
% plot(Step,Eyy,'--','color','r');
% plot(Step,Ezz,'--','color','g');
%
%
%
% hleg = legend('Exy','Eyz','Exz','Exx','Eyy','Ezz');
%
% set(hleg,'FontSize',16,'FontWeight','bold');
%
% xlabel('Step','fontsize',18,'fontweight','b');
% ylabel('Strain','fontsize',18,'fontweight','b');
%
%
