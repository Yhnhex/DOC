%% DESCRIPCIÓN:
% Esta función permite obtener la aceleración radial situado a una
% distancia determinada del centro de un astro a partir de esa distancia y
% su constante gravitatoria.
%% INPUTS:
% r [1x1]: Distancia al centro (km)
% mu [1x1]: Constante gravitatoria (km^3*s-2). Para la Tierra: 3,986*10^5 
% km^3*s-2
%% OUTPUTS:
% g [1x1]: Aceleración gravitatoria en m/s^2

function g = radial_Acceleration(r,mu)
    g = mu/(1000*r^2);
end