%% X
if X(i) > Box(1,2)
    X(i)=X(i) - Lx;
end

if X(i) < Box(1,1)
    X(i)=X(i) + Lx;
end

%% Y

if Y(i) > Box(2,2)
    Y(i)=Y(i) - Ly;
end

if Y(i) < Box(2,1)
    Y(i)=Y(i) + LY;
end


%% Z
if Z(i) > Box(3,2)
    Z(i)=Z(i) - Lz;
end

if Z(i) < Box(3,1)
    Z(i)=Z(i) + Lz;
end