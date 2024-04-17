%% DESCRIPCIÓN:
% Esta función obtiene la matriz TRIAD de rotación asociada a unos ejes a 
% partir de 2 vectores unitarios en un mismo sistema de ejes. 
%% INPUTS:
% n_1 [3x1]: Vector unitario 1.
% n_2 [3x1]: Vector unitario 2.
%% OUTPUTS:
% Triad_matrix [3x3]: Matriz TRIAD que contiene por columnas los vectores t
% asociados a los dos vectores unitarios dados.

function Triad_matrix = TRIAD(n_1, n_2)
    
    t1 = n_1;
    t2 = cross(n_1, n_2) / norm(cross(n_1, n_2));
    t3 = cross(t1, t2);

    Triad_matrix = [t1, t2, t3];

end

