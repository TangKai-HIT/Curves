function plotNurbs_3D(ax, control_pts, weights, p, u_vec)
%plotNurbs_3D plot 3D Nurbs

%Sample
u=linspace(u_vec(1), u_vec(end), 500);
pts = nurbsEval(control_pts, weights, p, u_vec, u);

%plot control polygon
hold on;
plot3(ax, control_pts(:, 1), control_pts(:, 2), control_pts(:, 3), '--o', 'Color', 'blue', LineWidth=0.6);

%plot curve
plot3(ax, pts(:, 1), pts(:, 2), pts(:, 3), '-r', LineWidth=0.8);