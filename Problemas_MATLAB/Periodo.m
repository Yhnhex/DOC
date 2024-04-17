%% DESCRIPCIÓN:
% Esta función obtiene el período orbital de una órbita a partir de su
% semieje mayor y de la constante mu. OJO: mu y a deben ir en las mismas
% unidades de distancia: m o km.
%% INPUTS:
% a [1x1]: Semieje mayor de la órbita
% mu [1x1]: Constante gravitatoria del astro. Para la Tierra es 3,986*10^5
% km^3 s^-2
%% OUTPUTS:
% T_orb [s]: Obtiene en s el período de la órbita.

function T_orb = Periodo(a,mu)
    T_orb = 2*pi*sqrt(a^3/mu)/3600;
end