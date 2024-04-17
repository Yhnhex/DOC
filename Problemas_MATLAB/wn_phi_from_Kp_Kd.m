%% DESCRPICIÓN:
% Esta función calcula la frecuencia natural, el
% coeficiente de amortiguamiento y el momento de inercia del sistema a 
% partir de los coeficientes Kd y Kp de un sistema con ley de
% control proporcional derivativa. 
%% INPUTS:
% Kp [1x1]: Coeficiente del término independiente de s en la ley de control
% proporcional derivativa
% Kd [1x1]: Coeficiente del término dependiente linealmente de s en la ley
% de control proporcional derivativa
%% OUTPUTS:
% wn [1x1]: Frecuencia natural del sistema en rad/s
% phi [1x1]: Coeficiente de amortiguamiento del sistema
% I [1x1]: Momento de inercia del sistema en kg*m^2

function [wn, phi] = wn_phi_from_Kp_Kd(Kp,Kd,I)
    wn = sqrt(Kp/I);
    phi = Kd/(2*I*wn);
end