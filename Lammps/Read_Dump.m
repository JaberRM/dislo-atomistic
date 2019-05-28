%%%%%%%%

%%%%%%%%

fid = fopen(FileN, 'r+');
% fid = fopen('./dumpsPF/dump125.lammps', 'r+');


for i=1:3
    fgetl(fid);
end

AtomN= fscanf(fid,'%f',[1,1])';

for i=1:2
    fgetl(fid);
end
Box = fscanf(fid,'%f',BSize)';

for i=1:2
    fgetl(fid);
end

Atom = fscanf(fid,'%f',[FieldN,AtomN])';
fgetl(fid);


fclose(fid);

