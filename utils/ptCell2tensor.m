function pt_tensor = ptCell2tensor(point_cell)
%PTCELL2TENSOR load points cell matrix to tensor
%   Input:
%       point_cell: dim1--u, dim2--v

[N, M] = size(point_cell);
dim = length(point_cell{1,1});

pt_tensor  = zeros(N, M, dim);

for i=1:N
    for j=1:M
        pt_tensor(i, j, :) = point_cell{i, j};
    end
end

end

