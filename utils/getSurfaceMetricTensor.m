function G = getSurfaceMetricTensor(u, v, surfaceGradFcn)
%GETSURFACEMETRICTENSOR get parametric surface metric tensor on local tangent space (First basic form coefficient matrix)
%   Inputs:
%       u, v: 
%       surfaceGradFcn: return 2 X dim

grad = surfaceGradFcn(u, v); %2 X dim

G = grad * grad';