%% DESCRIPCIÓN:
% Esta función calcula el tiempo de subida de un sistema subamortiguado a
% partir de su frecuencia natural y su coeficiente de amortiguamiento. Como
% resultados intermedios, también devuelve la frecuencia propia del sistema
% amortiguado y el ángulo que forma el polo correspondiente con el eje real 
% negativo.
%% INPUTS:
% wn [1x1]: Frecuencia natural del sistema sin amortiguar, en rad/s
% phi [1x1]: Coeficiente de amortiguamiento del sistema
%% OUTPUTS:
% tr [1x1]: Tiempo de subida del sistema, en s
% wd [1x1]: Frecuencia propia del sistema amortiguado, en rad/s
% beta [1x1]: Ángulo que forma el polo con el eje real negativo 

function [tr,wd,beta] = tr_from_wn_phi(wn,phi)
    wd = wn*sqrt(1-phi^2);
    beta = atan((sqrt(1-phi^2))/phi);
    tr = (pi - beta)/wd;
end
