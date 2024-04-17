%% DESCRIPCIÓN:
% Esta función calcula el coeficiente de overshoot a partir del
% coeficiente de amortiguamiento de un sistema subamortiguado.
%% INPUTS:
% phi [1x1]: Coeficiente de amortiguamiento
%% OUTPUTS:
% Mp [1x1]: Coeficiente de overshoot EN TANTO POR UNO, no en porcentaje

function Mp = Mp_from_phi(phi)
    Mp = exp((-pi*phi)/sqrt(1-phi^2));
end