%% DESCRIPCIÓN:
% Esta función permite obtener el semieje mayor a partir del radio y la
% velocidad orbitales en un punto
%% INPUTS:
% r [1x1]: Radio orbital, en km
% v [1x1]: Velocidad orbital, en km/s
% mu [1x1]: Constante gravitatoria, en km^3/s^2. Para la Tierra vale
% 3,986*10^5 km^3/s^2
%% OUTPUTS:
% a [1x1]: Semieje mayor, en km

function a = SMA_from_r_v(r,v,mu)
    a = 1/(2/r - v^2/mu);
end