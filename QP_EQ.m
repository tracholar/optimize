%% 二次优化，方程约束
% min  1/2 x'Gx + x'd
% s.t. Ax = b
% 直接利用KKT条件可以求解
function [x, y, lambda] = QP_EQ(G, d, A, b)
    n = length(G);
    m = size(A,1);
    B = [-d; b];
    M = [G -A'; A zeros(m)];
    X = M \ B;
    x = X(1:n);
    lambda = X(n+1:end);
    y = 1/2*x'*G*x + x'*d;
end