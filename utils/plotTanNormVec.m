function plotTanNormVec(ax, e_u, e_v, n, positions)
%PLOTTANNORMVEC plot tangent & normal vectors on surface at specified positions
%   Inputs:
%       e_u, e_v, n, positions: N X dim

hold(ax,"on");

plot3(ax, positions(:, 1), positions(:, 2), positions(:, 3), "or", "MarkerSize", 8, "MarkerFaceColor","red");

quiver3(ax, positions(:, 1), positions(:, 2), positions(:, 3), e_u(:, 1), e_u(:, 2), e_u(:, 3), 0.2, '-b', 'filled', "LineWidth", 1.5);
quiver3(ax, positions(:, 1), positions(:, 2), positions(:, 3), e_v(:, 1), e_v(:, 2), e_v(:, 3), 0.2, '-b', 'filled', "LineWidth",  1.5);
quiver3(ax, positions(:, 1), positions(:, 2), positions(:, 3), n(:, 1), n(:, 2), n(:, 3), 0.2, '-b', 'filled', "LineWidth",  1.5);