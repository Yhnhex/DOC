%% DESCRIPCIÓN:
% Esta función permite calcular la fuerza de radiación incidente a una
% superficie a partir del flujo solar que le llega, la reflectividad de la
% superficie y el área que es perpendicular al flujo incidente.
%% INPUTS:
% Flux [1x1]: Flujo solar incidente, en W/m^2. En la Tierra vale 1362 W/m^2
% q [1x1]: Reflectividad de la superficie, varía de 0 a 1
% A [1x1]: Área perpendicular al flujo incidente, en m^2
%% OUTPUTS:
% Frad [1x1]: Fuerza de radiación solar, en N

function Frad = Frad_from_Flux_q_A(Flux,q,A)
    c = 3e8;    
    Frad = Flux/c *(1+q)*A;
end