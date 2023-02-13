%demo1: generate a Bezier controlled surface
addpath(genpath('../'));

%% init params 
surface_ctrl_pts = {[0, 0, 15], [0, 50, 65], [0, 102, 2.3], [0, 150, 15];
                                   [76, 0, 65], [50, 76, -10], [50,102, 65], [89,150,53];
                                   [102, 0, -5.5], [102,102, 40], [102, 76, -10], [127,150,15];
                                   [150, 0,15], [150,12.7, -10], [150, 76, 48], [150,150,15]};
% surface_ctrl_pts = surface_ctrl_pts';
surface_ctrl_pts = ptCell2tensor(surface_ctrl_pts); %load to tensor

m1 = 3; m2=3; %bicubic bezier

%% show surface
plotBezierSurface(gca, m1, m2, surface_ctrl_pts, 0:0.02:1, 0:0.02:1);