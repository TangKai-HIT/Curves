%% parameters
control_pts = [[50, 0, 0]; [100, 100, 0]; [60, 40, 0]; [50, 100, 0]; [40, 40, 0];[0, 100, 0]; [50, 0, 0]; ];

knots_vec = [0, 0, 0, 0.2, 0.4, 0.6, 0.8, 1, 1, 1];

weights = [1, 1, 1, 1, 1, 1, 1];

p = 2;

save trident control_pts knots_vec weights p;

%% plot
load trident.mat;

figure();
plotNurbs_3D(gca, control_pts, weights, p, knots_vec);