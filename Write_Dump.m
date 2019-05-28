%%%%%%%%

%%%%%%%%


%% Dump write
% fid = fopen('Lammps/dump_Dis.out', 'w');
% 
% fprintf(fid,'ITEM: TIMESTEP\n');
% 
% fprintf(fid,'1\n');
% fprintf(fid,'ITEM: NUMBER OF ATOMS\n');
% fprintf(fid,'%d\n',AtomN);
% fprintf(fid,'ITEM: BOX BOUNDS pp pp pp\n');
% 
% fprintf(fid,'%d %d %d\n',Box(1,1),Box(1,2),Box(1,3));
% fprintf(fid,'%d %d %d\n',Box(2,1),Box(2,2),Box(2,3));
% fprintf(fid,'%d %d %d\n',Box(3,1),Box(3,2),Box(3,3));
% 
% fprintf(fid,'ITEM: ATOMS id type x y z \n');
% 
% 
% for i=1:AtomN
%     
%     fprintf(fid,'%d %d %d %d %d \n', i ,1, X(i),Y(i),Z(i));
%     
%     
% end
% 
% 
% fclose(fid);

%% Data file write


fid = fopen('Lammps/dump_Dis.out', 'w');

fprintf(fid,'LAMMPS data file for Dislocation\n');

fprintf(fid,'%d atoms\n',AtomN);
fprintf(fid,'2 atom types\n');


fprintf(fid,'%d %d xlo xhi\n',Box(1,1),Box(1,2));
fprintf(fid,'%d %d ylo yhi\n',Box(2,1),Box(2,2));
fprintf(fid,'%d %d zlo zhi\n',Box(3,1),Box(3,2));
fprintf(fid,'%d %d %d xy xz yz\n',Box(1,3),Box(2,3),Box(3,3));

fprintf(fid,'\n');

fprintf(fid,'Atoms \n');
fprintf(fid,'\n');

for i=1:AtomN
    
    fprintf(fid,'%d %d %d %d %d \n', Atom(i,1) ,1, X(i),Y(i),Z(i));
    
    
end


fclose(fid);
