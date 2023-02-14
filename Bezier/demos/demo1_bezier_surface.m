%demo1: generate a Bezier controlled surface
addpath(genpath('../../'));

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

%% show an isoparametric curve & sampled points coordinate frame
fix_v = 0.6;
equal_CtrlPts = bezierSurface_isoParamCurve(surface_ctrl_pts, fix_v, 'v');

N = 100;
u = linspace(0,1,N);
isoCurvePts = bezierEval(m1, u, equal_CtrlPts);
%plot curve
hold on;
plot3(gca, isoCurvePts(:,1), isoCurvePts(:,2), isoCurvePts(:,3), "-m", "LineWidth", 2.5);

%plot sampled points coordinate frame
u_sample = u(1:10:end);
u_samplePts = bezierEval(m2, u_sample, equal_CtrlPts);

e_u = zeros(length(u_sample), 3);
e_v = zeros(length(u_sample), 3);
n = zeros(length(u_sample), 3);

for i = 1:length(u_sample)
    [e_u(i, :), e_v(i, :), n(i, :)] = bezierSurface_getTanNorm(surface_ctrl_pts, u_sample(i), fix_v);
end

plotTanNormVec(gca, e_u, e_v, n, u_samplePts);