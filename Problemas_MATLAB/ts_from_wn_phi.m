%% DESCRIPCIÓN:
% Esta función calcula el tiempo de establecimiento de un sistema subamortiguado a
% partir de la frecuencia natural y del coeficiente de amortiguamiento
% del sistema. Tiene incluida la aproximación para 0.1 < phi < 0.9 y la
% expresión analítica por si hay un coeficiente de amortiguamiento fuera de
% ese rango.
%% INPUTS:
% wn [1x1]: Frecuencia natural del sistema en rad/s
% phi [1x1]: Coeficiente de amortiguamiento del sistema
%% OUTPUTS:
% ts [1x1]: Tiempo de establecimiento del sistema en s

function ts = ts_from_wn_phi(wn,phi)
    if 0.1 < phi && 0.9 > phi
        ts = 4.4/(wn*phi);
    else
        ts = log(0.02*sqrt(1-phi^2))/(-phi*wn);
    end
end