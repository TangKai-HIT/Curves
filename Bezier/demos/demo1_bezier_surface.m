%demo1: generate a Bezier controlled surface
addpath(genpath('../'));
%% init params 
p = 3; q=3;

control_pts = zeros(p+1,q+1,3);
rng(2);
for i = 1:p+1
    for j=1:q+1
        control_pts(i,j,:) = [i, j, randn(1)];
    end
end

%% show surface
plotBezierSurface(gca, p, q, control_pts, 0:0.02:1, 0:0.02:1);