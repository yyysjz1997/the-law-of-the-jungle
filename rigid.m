function dy = rigid(t,y)
%dy = zero(2,1);
% dy(1) = (r1 - l1 * y(2)) * y(1);
% dy(2) = -(r2 - l2 * y(1)) * y(2);
dy(1) = (0.5 - 0.01 * y(2)) * y(1);
dy(2) = -(0.01 - 0.001 * y(1)) * y(2);