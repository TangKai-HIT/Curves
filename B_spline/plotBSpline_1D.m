function plotBSpline_1D(ax, control_pts, p, u_vec)
%PLOTBSPLINE_1D plot 1D B-Spline

%Sample
u=linspace(u_vec(1), u_vec(end), 500);
pts = my_bsplineEval(control_pts, p, u_vec, u);

%plot control polygon
hold on;
plot(ax, getCtrlPolyIndex(p, u_vec), control_pts, '--o', 'Color', 'blue', LineWidth=0.6);

%plot curve
plot(ax, u, pts, '-r', LineWidth=0.8);