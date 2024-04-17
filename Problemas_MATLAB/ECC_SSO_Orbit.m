%% DESCRIPCIÓN:
% Esta función devuelve el valor de excentricidad para una órbita SSO y
% para unos determinados semieje mayor e inclinación.
%% INPUTS:
% a [1x1]: Semieje mayor de la órbita, en km
% mu [1x1]: Constante gravitatoria, en km^3/s^2. Para la Tierra tiene un
% valor de 3,986*10^5 km^3/s^2
% i [1x1]: Inclinación de la órbita, en rad
%% OUTPUTS:
% e [1x1]: Excentricidad de la órbita

function e = ECC_SSO_Orbit(a,mu,i)
    J2 = 1.083e-3;
    R_E = 6378;
    Dot_Omega = 1.99e-7;
    
    e = sqrt(1 - sqrt((3*J2*R_E^2)/(2*Dot_Omega)* sqrt (mu/(a^7)*cos(i))));
end