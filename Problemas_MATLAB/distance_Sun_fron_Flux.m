%% DESCRIPCIÓN:
% Esta función calcula la distancia al Sol a partir del flujo solar
% incidente, utilizando los valores conocidos de distancia y flujo solar en
% la Tierra.
%% INPUTS:
% Flux [1x1]: Flujo solar en el punto donde quieres calcular la distancia,
% en W/m^2
%% OUTPUTS:
% d [1x1]: Distancia al Sol, en km

function d = distance_Sun_fron_Flux(Flux)
    r_E = 1.5e8;
    Flux_E = 1362;
    d = r_E *sqrt(Flux_E/Flux);
end