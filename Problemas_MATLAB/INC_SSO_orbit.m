%% DESCRIPCIÓN:
% Esta función devuelve el valor de inclinación para una órbita SSO y
% para unos determinados semieje mayor y excentricidad.
%% INPUTS:
% a [1x1]: Semieje mayor de la órbita, en km
% mu [1x1]: Constante gravitatoria, en km^3/s^2. Para la Tierra tiene un
% valor de 3,986*10^5 km^3/s^2
% e [1x1]: Excentricidad de la órbita
%% OUTPUTS:
% i [1x1]: Inclinación de la órbita, en rad

function i = INC_SSO_orbit(a,e,mu)
    J2 = 1.083e-3;
    R_E = 6378;
    Dot_Omega = 1.99e-7;

    i = acos(((-3*J2*R_E^2*Dot_Omega)/(2*(1-e^2)^2)*sqrt(mu/a^7))^-1);
end