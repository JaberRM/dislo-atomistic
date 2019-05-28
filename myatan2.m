function R = myatan2 (Y,X)

R = zeros(length(Y),1);

cnd = Y >= 0;

R(cnd) = atan2( Y(cnd),X(cnd) ) - pi;
R(~cnd) = atan2( Y(~cnd),X(~cnd) ) + pi;

end
