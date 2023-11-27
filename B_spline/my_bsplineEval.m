function [pt, basis] = my_bsplineEval(control_pts, p, u_vec, u)
%MY_BSPLINEEVAL evaluate points on b-spline at u
%   Input:
%       control_pts: control points (m+1 X dim)
%       p
%       u_vec: 1 X N
%       u: 1 X N or N X 1 (eventually turned to N X 1)
%   Output:
%       pt: N X dim
%       basis: N X (p+1)

[~, dim] = size(control_pts);
N = length(u);
pt = zeros(N, dim);
basis = zeros(N, p+1);

if size(u, 1)==1
    u = u';
end

for i = 1:N
    %check out which span
    mu = whichSpan(u(i), p, u_vec) + 1;
    cur_ctrlPts = control_pts(mu-p:mu, :);

    %eval
    b=1;
    for r = 1:p
        t1 = u_vec(mu-r+1:mu);
        t2 = u_vec(mu+1:mu+r);
        omega = (u(i) - t1) ./ (t2 - t1);
        b = [(1-omega).*b, 0] + [0, omega.*b];
    end
    basis(i, :) = b;
    pt(i, :) = b * cur_ctrlPts;
end

end