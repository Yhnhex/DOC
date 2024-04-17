%% DESCRIPCIÓN:
% Esta función calcula el coeficiente de amortiguamiento a partir del
% coeficiente de overshoot de un sistema subamortiguado.
%% INPUTS:
% Mp [1x1]: Coeficiente de overshoot EN TANTO POR UNO, no en porcentaje
%% OUTPUTS:
% phi [1x1]: Coeficiente de amortiguamiento

function phi = phi_from_Mp(Mp)
    phi = -log(Mp)/sqrt(log(Mp)^2 + pi^2);
end