function [new_ctrlPts, new_knots] = bsplineKnotInsertOne(old_ctrlPts, old_knots, new_knot)
%BSPLINEKNOTINSERTONE single knot insertion (Bohm's method) in B-spline with same order, given single new knot
%   Inputs:
%       old_ctrlPts, old_knots
%       new_knot: one new knot

[n,dim] = size(old_ctrlPts);
p = length(old_knots) - n - 1;

new_ctrlPts =zeros(n+1, dim);
new_knots = zeros(1, length(old_knots)+1);

%% use Bohm's method (one knot at a time)
%check out which span
mu = whichSpan(new_knot, p, old_knots) + 1;

%new knots
new_knots(1:mu) = old_knots(1:mu);
new_knots(mu+1) = new_knot;
new_knots(mu+2:end) = old_knots(mu+1:end);

%new ctrl pts
new_ctrlPts(1:mu-p, :) = old_ctrlPts(1:mu-p, :);

for i = mu-p+1:mu
    new_ctrlPts(i, :) = ((new_knot-old_knots(i)) * old_ctrlPts(i, :) + (old_knots(i+p)-new_knot) * old_ctrlPts(i-1, :)) / (old_knots(i+p)-old_knots(i));
end

new_ctrlPts(mu+1:n+1, :) = old_ctrlPts(mu:n, :);

end

 