function index = getCtrlPolyIndex(p, knots)
%GETCTRLPOLYINDEX get index of control polygon
%   此处显示详细说明

n_knot = length(knots);
n = n_knot-p-1;
index = zeros(1, n);

for i = 1:n
    index(i) = sum(knots(i+1:i+p)) / p;
end

end

