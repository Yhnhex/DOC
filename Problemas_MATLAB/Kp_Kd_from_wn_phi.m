%% DESCRPICIÓN:
% Esta función calcula los coeficientes Kd y Kp de un sistema con ley de
% control proporcional derivativa a partir de la frecuencia natural, el
% coeficiente de amortiguamiento y el momento de inercia del sistema.
%% INPUTS:
% wn [1x1]: Frecuencia natural del sistema en rad/s
% phi [1x1]: Coeficiente de amortiguamiento del sistema
% I [1x1]: Momento de inercia del sistema en kg*m^2
%% OUTPUTS:
% Kp [1x1]: Coeficiente del término independiente de s en la ley de control
% proporcional derivativa
% Kd [1x1]: Coeficiente del término dependiente linealmente de s en la ley
% de control proporcional derivativa

function [Kp, Kd] = Kp_Kd_from_wn_phi(wn,phi,I)
    Kp = I*wn^2;
    Kd = 2*I*phi*wn;
end