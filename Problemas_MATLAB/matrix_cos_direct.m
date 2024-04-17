%% DESCRIPCIÓN: 
% Esta función devuelve la matriz de cosenos directores a partir de dos
% matrices 3x3 que contienen por COLUMNAS los 3 vectores ortonormales que
% forman las bases entre las que quieres sacar la matriz de cosenos
% directores.
%% INPUTS
% a: [3x3]: Matriz que contiene por columnas los vectores ortonormales de
% la base A
% b: [3x3]: Matriz que contiene por columnas los vectores ortonormales de
% la base B
%% OUTPUTS
% C_ab: [3x3]: Matriz de cosenos directores que describe la orientación de
% la base A relativa a la base B

function C_ab = matrix_cos_direct(a,b)

    % Comprobación de módulo unitario de vectores:
    module_a(1) = sqrt(a(1,1)^2 + a(2,1)^2 + a(3,1)^2); 
    module_a(2) = sqrt(a(1,2)^2 + a(2,2)^2 + a(3,2)^2); 
    module_a(3) = sqrt(a(1,3)^2 + a(2,3)^2 + a(3,3)^2); 
    module_b(1) = sqrt(b(1,1)^2 + b(2,1)^2 + b(3,1)^2); 
    module_b(2) = sqrt(b(1,2)^2 + b(2,2)^2 + b(3,2)^2); 
    module_b(3) = sqrt(b(1,3)^2 + b(2,3)^2 + b(3,3)^2);

    for i = 1:3
        if module_a(i) == 1

        else
            a(1,i) = a(1,i)/module_a;
            a(2,i) = a(2,i)/module_a; 
            a(3,i) = a(3,i)/module_a;
        end
        if module_b(i) == 1

        else
            b(1,i) = b(1,i)/module_a;
            b(2,i) = b(2,i)/module_a; 
            b(3,i) = b(3,i)/module_a;
        end
    end

    % Obtención de la matriz de cosenos directores
    C_ab = zeros(3,3);
    for i = 1:3
        for j = 1:3
            C_ab(i,j) = a(:,i)'*b(:,j);
        end
    end
end