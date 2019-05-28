%%%%%%%%

%%%%%%%%

fid = fopen('Lammps/dump_Fcc.out', 'r+');

for i=1:3
    fgetl(fid);
end

AtomN= fscanf(fid,'%f',[1,1])';

for i=1:2
    fgetl(fid);
end
Box = fscanf(fid,'%f',[3,3])';

for i=1:2
    fgetl(fid);
end

Atom = fscanf(fid,'%f',[FieldN,AtomN])';
fgetl(fid);


fclose(fid);


P=zeros(AtomN,3);

for i=1:AtomN
    
    P(i,1) = Atom(i,3);
    P(i,2) = Atom(i,4);
    P(i,3) = Atom(i,5);

end