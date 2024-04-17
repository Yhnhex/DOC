%% DESCRIPCIÓN:
% Esta función calcula el flujo solar incidente a partir de la distancia al
% Sol, utilizando los valores conocidos de distancia y flujo solar en
% la Tierra.
%% INPUTS:
% d [1x1]: Distancia al Sol, en km
%% OUTPUTS:
% Flux [1x1]: Flujo solar en el punto donde quieres calcular la distancia,
% en W/m^2

function Flux = Solar_Flux_fron_distance_Sun(d)
    r_E = 1.5e8;
    Flux_E = 1362;
    Flux = Flux_E *(r_E/d)^2;
end