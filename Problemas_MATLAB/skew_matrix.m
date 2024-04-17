%% DESCRIPCIÓN:
% Esta función devuelve la matriz skew-simétrica a partir de los elementos
% de un vector.
%% INPUTS:
% x [3x1]: Vector del que se quiere sacar la matriz
%% OUTPUTS:
% x_skew [3x3]: Matriz skew-simétrica del vector x

function x_skew = skew_matrix(x)
    x_skew = [0, -x(3), x(2); x(3), 0, -x(1); -x(2), x(1), 0];

end