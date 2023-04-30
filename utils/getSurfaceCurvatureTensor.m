function Omega = getSurfaceCurvatureTensor(u, v, normal_vec, surfaceHessianFcn)
%GETSURFACECURVATURETENSOR get parametric surface curvature tensor on local tangent space (Second basic form coefficient matrix)
%   Inputs:
%       u, v
%       surfaceHessianFcn: return 2 X 2 X dim Hessian Matrix
%       normal_vec: 1 X dim

hessian = surfaceHessianFcn(u, v); %2 X 2 X dim

Omega = tensorprod(hessian, normal_vec, 3, 2);