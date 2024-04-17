%% DESCRIPCIÓN:
% Esta función obtiene la velocidad en un punto concreto de la órbita a
% partir del radio en ese punto, el semieje mayor y la constante
% gravitatoria del planeta. OJO: r, a y mu deben tener las mismas unidades
% de distancia: km o m.
%% INPUTS:
% r [1x1]: Radio orbital en el punto en el que se quiere calcular la
% velocidad.
% a [1x1]: Semieje mayor de la órbita.
% mu [1x1]: Constante gravitatoria del astro. Para la Tierra es 3,986*10^5
% km^3 s^-2
%% OUTPUTS:
% veloc [1x1]: Velocidad de la nave, en la unidad de distancia dada por
% segundo.

function veloc = V(r,a,mu)

    veloc = sqrt(mu*(2/r - 1/a));

end
