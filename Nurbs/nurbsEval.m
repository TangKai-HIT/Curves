function pt = nurbsEval(control_pts, weights, p, u_vec, u)
%NURBSEVAL evaluate points on nurbs at u
%   Input:
%       control_pts: control points (m+1 X dim)
%       weights: 1 X N or N X 1
%       p
%       u_vec
%       u: 1 X N or N X 1 (eventually turned to N X 1)
%   Output:
%       pt: N X dim

[m, dim] = size(control_pts);
N = length(u);
pt = zeros(N, dim);

if size(u, 1)==1
    u = u';
end

% %check out which span
% span_Id = whichSpan(u, p, u_vec);
% 
% %compute at most p+1
% for j=max(0,span_Id-p) : span_Id
%     pt = pt + control_pts(j+1, :) .* my_bsplineBasis(j, p, u_vec, u);
% end
sum = 0;
for j=0 : m-1
    temp = weights(j+1) * my_bsplineBasis(j, p, u_vec, u);
    sum = temp + sum;
    pt = pt +  control_pts(j+1, :) .* temp;
end

pt = pt ./ sum;
end