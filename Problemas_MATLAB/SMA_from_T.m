%% DESCRIPCIÓN:
% Esta función calcula el semieje mayor de una órbita a partir de su
% período orbital y la constante gravitatoria del astro sobre el que orbita.
%% INPUTS:
% T [1x1]: Período de la órbita, en km
% mu [1x1]: Constante gravitatoria, en km^3/s^2. Para la Tierra tiene un
% valor de 3,986*10^5 km^3/s^2
%% OUTPUTS:
% a [1x1]: Semieje mayor de la órbita, en km

function a = SMA_from_T(T,mu)
    a = (mu*(T/(2*pi))^2)^(1/3);
end