%% DESCRIPCIÓN:
% Esta función devuelve el valor de la inclinación de la órbita en radianes
% según el signo que se requiera. Para órbitas heliosíncronas, la
% inclinación debe ser mayor de 90º, por lo que el signo será negativo.
%% INPUTS:
% sgn [boolean]: 1 para inclinación < 90º, 0 para inclinación > 90º
%% OUTPUTS:
% i [1x1]: Inclinación de la órbita Frozen, en rad

function i = INC_Frozen_Orbit(sgn)
    if sgn == 1
        i = acos(1/sqrt(5));
    else
        i = - acos(1/sqrt(5));
    end
end
    