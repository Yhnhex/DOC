%% DESCRIPCIÓN:
% Esta función calcula la frecuencia natural de un sistema subamortiguado a
% partir del tiempo de establecimiento y del coeficiente de amortiguamiento
% del sistema. Tiene incluida la aproximación para 0.1 < phi < 0.9 y la
% expresión analítica por si hay un coeficiente de amortiguamiento fuera de
% ese rango.
%% INPUTS:
% ts [1x1]: Tiempo de establecimiento del sistema en s
% phi [1x1]: Coeficiente de amortiguamiento del sistema
%% OUTPUTS:
% wn [1x1]: Frecuencia natural del sistema en rad/s

function wn = wn_from_ts_phi(ts,phi)
    if 0.1 < phi && 0.9 > phi
        wn = 4.4/(ts*phi);
    else
        wn = log(0.02*sqrt(1-phi^2))/(-phi*ts);
    end
end